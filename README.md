# nodejs-box

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build Status](https://travis-ci.com/extra2000/nodejs-box.svg?branch=master)](https://travis-ci.com/extra2000/nodejs-box) [![Build status](https://ci.appveyor.com/api/projects/status/57d32bgoimmd65n9/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/nodejs-box/branch/master) |

NodeJS developer box for learning purpose


## Getting started

Clone this repository and `cd`:
```
$ git clone --recursive https://github.com/extra2000/nodejs-box.git
$ cd nodejs-box
```


## Preparing environment

To create devbox and apply required states such as podman and bridge network for inter-pod communications:
```
$ vagrant up --provider=libvirt
$ vagrant ssh nodejs-box -- sudo salt-call state.highstate
```


## Sample apps

* [math](docs/sampleapps/math.md)
* [zeromq-pushpull](docs/sampleapps/zeromq-pushpull.md)
* [kafka-pubsub](docs/sampleapps/kafka-pubsub.md)
* [kong-podman](docs/sampleapps/kong-podman.md)
