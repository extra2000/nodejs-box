# -*- coding: utf-8 -*-
# vim: ft=sls

/opt/sampleapps:
  file.directory:
    - user: {{ pillar['sampleapps']['user']['name'] }}
    - group: {{ pillar['sampleapps']['user']['group'] }}
    - makedirs: false

sampleapps-math-files-present:
  file.recurse:
    - name: /opt/sampleapps/math
    - source: salt://sampleapps/files/math
    - user: {{ pillar['sampleapps']['user']['name'] }}
    - group: {{ pillar['sampleapps']['user']['group'] }}
    - template: jinja
    - force: true
