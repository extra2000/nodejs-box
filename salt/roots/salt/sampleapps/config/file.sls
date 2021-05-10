# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import SAMPLEAPPS with context %}

/home/{{ SAMPLEAPPS.hostuser.name }}/.config/cni/net.d:
  file.directory:
    - user: {{ SAMPLEAPPS.hostuser.name }}
    - group: {{ SAMPLEAPPS.hostuser.group }}
    - makedirs: true

/home/{{ SAMPLEAPPS.hostuser.name }}/.config/cni/net.d/podman-network-sampleapps.conflist:
  file.managed:
    - source: salt://sampleapps/files/podman-network-sampleapps.conflist.jinja
    - user: {{ SAMPLEAPPS.hostuser.name }}
    - group: {{ SAMPLEAPPS.hostuser.group }}
    - template: jinja
    - context:
      pod: {{ SAMPLEAPPS.pod }}

/opt/sampleapps:
  file.directory:
    - user: {{ SAMPLEAPPS.hostuser.name }}
    - group: {{ SAMPLEAPPS.hostuser.group }}
    - makedirs: false

sampleapps-files-present:
  file.recurse:
    - name: /opt/sampleapps/nodejs-examples
    - source: salt://sampleapps/files/nodejs-examples
    - user: {{ SAMPLEAPPS.hostuser.name }}
    - group: {{ SAMPLEAPPS.hostuser.group }}
    - template: jinja
    - force: true
