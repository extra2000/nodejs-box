# nodejs-box

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/57d32bgoimmd65n9/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/nodejs-box/branch/master) |

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
$ cp -v vagrant/examples/Vagrantfile.nodejs-box.fedora-34.x86_64.example vagrant/Vagrantfile.nodejs-box
```

Execute the following command to create Vagrant box and provision the box:
```
$ vagrant up --provider=libvirt
$ vagrant ssh nodejs-box -- sudo salt-call state.highstate
```


## Sample apps

Initializing sample apps:
```
$ vagrant ssh nodejs-box -- sudo salt-call state.sls sampleapps
$ vagrant ssh nodejs-box
$ cd /opt/sampleapps/nodejs-examples
```
