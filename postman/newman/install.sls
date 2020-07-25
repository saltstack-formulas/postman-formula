# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}

    {%- if grains.os == 'MacOS' %}

postman-newman-install-cmd-run-brew:
  cmd.run:
    - name: brew install newman
    - runas: {{ postman.rootuser }}
    - onlyif:
      - test -x /usr/local/bin/brew
      - {{ grains.os_family == 'MacOS' }}

    {%- else %}

postman-newman-install-cmd-run-npm:
  cmd.run:
    - name: npm install -g newman
    - onlyif: test -x /usr/bin/npm || test -x /usr/local/bin/npm

    {%- endif %}
