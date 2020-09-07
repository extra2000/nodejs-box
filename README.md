# nodejs-devbox

NodeJS developer box for learning purpose


## Getting started

Clone this repository and `cd`:
```
$ git clone --recursive https://github.com/extra2000/nodejs-devbox.git
$ cd nodejs-devbox
```

To create devbox and required development tools:
```
$ vagrant up --provider=libvirt nodejs-ubuntu1804
$ vagrant ssh nodejs-ubuntu1804
$ sudo salt-call state.sls node
```
