# Sample apps: Math

```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/apps/math
$ podman build -t extra2000/mathapp:latest .
$ podman run --rm localhost/extra2000/mathapp
```
