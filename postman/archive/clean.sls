# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}

postman-package-archive-clean-file-absent:
  file.absent:
    - names:
              {%- if grains.os == 'MacOS' %}
      - {{ postman.config.path }}/{{ postman.pkg.archive.name }}
              {%- else %}
      - {{ postman.config.path }}
              {%- endif %}
      - {{ postman.dir.tmp }}
