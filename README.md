# nodejs-box

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fextra2000%2Fnodejs-box.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fextra2000%2Fnodejs-box?ref=badge_shield) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/57d32bgoimmd65n9/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/nodejs-box/branch/master) |

NodeJS developer box for learning purpose


## Getting started

Clone this repository and `cd`:
```
$ git clone --recursive https://github.com/extra2000/nodejs-box.git
$ cd nodejs-box
```


## Preparing environment

Create pillar files:
```
$ cp -v salt/roots/pillar/podman.sls.example salt/roots/pillar/podman.sls
```

Rename example box:
```
$ cp -v vagrant/examples/Vagrantfile.nodejs-box.fedora-33.x86_64.example vagrant/Vagrantfile.nodejs-box
```

To create devbox and apply required states such as podman and bridge network for inter-pod communications:
```
$ vagrant up --provider=libvirt
$ vagrant ssh nodejs-box -- sudo salt-call state.highstate
```


## Sample apps

* [salt/roots/salt/sampleapps/files/apps/math/](salt/roots/salt/sampleapps/files/apps/math/)[README.md](salt/roots/salt/sampleapps/files/apps/math/README.md)
* [salt/roots/salt/sampleapps/files/apps/zeromq-pushpull/](salt/roots/salt/sampleapps/files/apps/zeromq-pushpull/)[README.md](salt/roots/salt/sampleapps/files/apps/zeromq-pushpull/README.md)
* [salt/roots/salt/sampleapps/files/apps/kafka-pubsub/](salt/roots/salt/sampleapps/files/apps/kafka-pubsub/)[README.md](salt/roots/salt/sampleapps/files/apps/kafka-pubsub/README.md)
* [salt/roots/salt/sampleapps/files/apps/kong-podman/](salt/roots/salt/sampleapps/files/apps/kong-podman/)[README.md](salt/roots/salt/sampleapps/files/apps/kong-podman/README.md)


## License

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fextra2000%2Fnodejs-box.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fextra2000%2Fnodejs-box?ref=badge_large)
