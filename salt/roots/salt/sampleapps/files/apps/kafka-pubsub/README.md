# Sample apps: Kafka Pub/Sub

To run the sample apps:
```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/apps/kafka-pubsub
```


## Deploy Kafka pod

```
$ podman play kube kafka-pod.yaml
```

To test Kafka deployments:
```
$ podman run -it --rm docker.io/bitnami/kafka:2.6.0 /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper 10.77.1.1:2181 --replication-factor 1 --partitions 1 --topic testingtopic
$ podman run -it --rm docker.io/bitnami/kafka:2.6.0 bash -c 'echo "Hello, World" | /opt/bitnami/kafka/bin/kafka-console-producer.sh --bootstrap-server 10.77.1.1:9092 --topic testingtopic'
$ podman run -it --rm docker.io/bitnami/kafka:2.6.0 /opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server 10.77.1.1:9092 --topic testingtopic --from-beginning
```

## Deploy producer and consumer services

```
$ podman build -t extra2000/prodcon:latest .
$ podman play kube producer-pod.yaml
$ podman play kube consumer-pod.yaml
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
