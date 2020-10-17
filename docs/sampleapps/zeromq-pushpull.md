# Sample apps: ZeroMQ Push/Pull

```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/apps/zeromq-pushpull
$ podman build -t extra2000/zeromq-pushpull:latest .
$ podman play kube zeromq-pushpull-pod.yaml
```

View logs:
```
$ podman logs producer
$ podman logs worker
```

To clean up:
```
$ podman pod rm --force --all
```
