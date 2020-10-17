# Sample apps: Kong Podman

Apply state `sampleapps`, ssh into box, and then cd into apps root directory:
```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/apps/kong-podman
```


## Deploy Postgres

```
$ podman play kube postgres-pod.yaml
```

Bootstrap Kong database for the first time:
```
$ podman run --rm --pod postgres-pod --volume="./kong.conf:/etc/kong/kong.conf:ro,z" -e "KONG_PG_HOST=localhost" docker.io/library/kong:2.1.4 kong migrations bootstrap
```

Test to make sure postgres works:
```
$ podman run -it --rm --pod=postgres-pod docker.io/postgres:13.0 psql --host=localhost --username=kong --dbname=kongdb
```


## Deploy Kong

Start Kong:
```
$ podman play kube kong-pod.yaml
```

Test Kong and make sure no error, for example:
```
$ curl -i http://localhost:8001
$ podman run -it --rm docker.io/curlimages/curl curl http://10.77.1.1:8001
```


## Running NodeJS webservice

```
$ podman build -t extra2000/webservice:latest .
$ podman play kube webservice-pod.yaml
```

Test make sure the NodeJS webservice is working:
```
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl http://10.77.1.1:10000/api/v1/customers
```

Register NodeJS webservice into Kong and setup routing:
```
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i -X POST --url http://localhost:8001/services/ --data 'name=webservice' --data 'url=http://10.77.1.1:10000'
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i -X POST --url http://localhost:8001/services/webservice/routes --data 'name=webservice-route' --data 'hosts[]=10.77.1.1'
```

To test:
```
$ podman run -it --rm docker.io/curlimages/curl curl -i -X GET http://10.77.1.1:8000/api/v1/customers --header 'Host: 10.77.1.1'
```

To list services and routes:
```
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i http://localhost:8001/services
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i http://localhost:8001/routes
```

To delete a service, delete their routes first:
```
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i -X DELETE --url http://localhost:8001/routes/webservice-route
$ podman run -it --rm --pod=kong-pod docker.io/curlimages/curl curl -i -X DELETE --url http://localhost:8001/services/webservice
```


## Cleaning up

To remove all pods including containers:
```
$ podman pod rm --force --all
```
