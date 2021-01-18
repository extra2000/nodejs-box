# Sample apps: Kafka Pub/Sub

To run the sample apps:
```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/apps/kafka-pubsub
```


## Deploy Kafka pod

```
$ podman play kube --network=sampleapps kafka-pod.yaml
```

To test Kafka deployments:
```
$ podman run -it --rm --network=sampleapps docker.io/bitnami/kafka:2.6.0 /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper kafka-pod:2181 --replication-factor 1 --partitions 1 --topic testingtopic
$ podman run -it --rm --network=sampleapps docker.io/bitnami/kafka:2.6.0 bash -c 'echo "Hello, World" | /opt/bitnami/kafka/bin/kafka-console-producer.sh --bootstrap-server kafka-pod:9092 --topic testingtopic'
$ podman run -it --rm --network=sampleapps docker.io/bitnami/kafka:2.6.0 /opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-pod:9092 --topic testingtopic --from-beginning
```

## Deploy producer and consumer services

```
$ podman build -t extra2000/prodcon:latest .
$ podman play kube --network=sampleapps producer-pod.yaml
$ podman play kube --network=sampleapps consumer-pod.yaml
```

See logs:
```
$ podman logs producer-pod-producer
$ podman logs consumer-pod-consumer
```


## To clean up

```
$ podman pod rm --force --all
```
