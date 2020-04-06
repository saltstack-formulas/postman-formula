# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}

    {%- if 'config' in postman and postman.config %}
           {%- set sls_package_clean = tplroot ~ '.archive.clean' %}
    {%- endif %}

include:
  - {{ sls_package_clean }}

postman-config-clean-file-absent:
  file.absent:
    - name: {{ postman.environ_file }}
    - require:
      - sls: {{ sls_package_clean }}
