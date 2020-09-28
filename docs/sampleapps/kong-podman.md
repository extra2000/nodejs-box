# Sample apps: Kong Podman

Apply state `sampleapps`, ssh into box, and then cd into apps root directory:
```
$ vagrant ssh nodejs-ubuntu1804 -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-ubuntu1804
$ cd /opt/sampleapps/apps/kong-podman
```


## Preparing Kong container

Create Postgres container:
```
$ sudo podman run --rm -d --name postgres --network=podman -p 5432:5432 -e "POSTGRES_PASSWORD=abcde12345" --volume="./initdb.sql:/docker-entrypoint-initdb.d/initdb.sql:ro,z" postgres:13.0
```

Test to make sure postgres works:
```
$ sudo podman run --network=podman -it --rm postgres:13.0 psql --host=postgres.local --username=kong --dbname=kongdb
```

Run Kong migrations:
```
$ sudo podman run --rm --network=podman --volume="./kong.conf:/etc/kong/kong.conf:ro,z" kong:2.1.4 kong migrations bootstrap
```

Start Kong:
```
$ sudo podman run --rm -d --name kong --network=podman -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 --volume="./kong.conf:/etc/kong/kong.conf:ro,z" kong:2.1.4
```

Test Kong and make sure no error:
```
$ curl -i http://nodejs-ubuntu1804:8001
```


## Running NodeJS webservice

Build and run our NodeJS webservice:
```
$ sudo podman build -t extra2000/webservice .
$ sudo podman run --rm -d --name=webservice --network=podman extra2000/webservice
```

Test make sure the NodeJS webservice is working:
```
$ sudo podman run -it --network=podman --rm curlimages/curl curl http://webservice.local:10000/api/v1/customers
```

Register NodeJS webservice into Kong and setup routing:
```
$ curl -i -X POST --url http://nodejs-ubuntu1804:8001/services/ --data 'name=nodejs-webservice' --data 'url=http://webservice.local:10000'
$ curl -i -X POST --url http://nodejs-ubuntu1804:8001/services/nodejs-webservice/routes --data 'name=nodejs-webservice-route' --data 'hosts[]=webservice.local'
```

To test:
```
$ curl -i -X GET http://nodejs-ubuntu1804:8000/api/v1/customers --header 'Host: webservice.local'
```

To list services and routes:
```
$ curl -i http://nodejs-ubuntu1804:8001/services
$ curl -i http://nodejs-ubuntu1804:8001/routes
```

To delete a service, delete their routes first:
```
$ curl -i -X DELETE --url http://nodejs-ubuntu1804:8001/routes/nodejs-webservice-route
$ curl -i -X DELETE --url http://nodejs-ubuntu1804:8001/services/nodejs-webservice
```
