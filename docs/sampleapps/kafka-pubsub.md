# Sample apps: Kafka Pub/Sub

To run the sample apps:
```
$ vagrant ssh nodejs-ubuntu1804 -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-ubuntu1804
$ cd /opt/sampleapps/apps/kafka-pubsub
$ npm install
$ npm run producer
$ npm run consumer
```
