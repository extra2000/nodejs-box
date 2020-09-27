# Sample apps: ZeroMQ Push/Pull

```
$ vagrant ssh nodejs-ubuntu1804 -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-ubuntu1804
$ cd /opt/sampleapps/apps/zeromq-pushpull
$ npm install
$ npm run producer
$ npm run worker
```
