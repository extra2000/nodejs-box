# -*- coding: utf-8 -*-
# vim: ft=sls

/opt/sampleapps:
  file.directory:
    - user: {{ pillar['sampleapps']['user']['name'] }}
    - group: {{ pillar['sampleapps']['user']['group'] }}
    - makedirs: false

sampleapps-files-present:
  file.recurse:
    - name: /opt/sampleapps/apps
    - source: salt://sampleapps/files/apps
    - user: {{ pillar['sampleapps']['user']['name'] }}
    - group: {{ pillar['sampleapps']['user']['group'] }}
    - template: jinja
    - force: true
