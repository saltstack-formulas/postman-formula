# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}

postman-newman-clean-cmd-run-brew:
  cmd.run:
    - name: brew uninstall newman
    - onlyif:
      -  test -x /usr/local/bin/brew
      - {{ grains.os_family == 'MacOS' }}

postman-newman-clean-cmd-run-npm:
  cmd.run:
    - name: npm uninstall -g newman
    - onlyif: test -x /usr/bin/npm || test -x /usr/local/bin/npm
