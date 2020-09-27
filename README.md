# nodejs-devbox

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build Status](https://travis-ci.com/extra2000/nodejs-devbox.svg?branch=master)](https://travis-ci.com/extra2000/nodejs-devbox) [![Build status](https://ci.appveyor.com/api/projects/status/57d32bgoimmd65n9/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/nodejs-devbox/branch/master) |

NodeJS developer box for learning purpose


## Getting started

Clone this repository and `cd`:
```
$ git clone --recursive https://github.com/extra2000/nodejs-devbox.git
$ cd nodejs-devbox
```


## Preparing environment

To create devbox and required development tools:
```
$ vagrant up --provider=libvirt nodejs-ubuntu1804
$ vagrant ssh nodejs-ubuntu1804 -- sudo salt-call state.highstate
```


## Sample apps

* [math](docs/sampleapps/math.md)
