# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

    {%- if postman.environ and 'path' in postman.config %}
           {%- set sls_package_install = tplroot ~ '.archive.install' %}

include:
  - {{ sls_package_install }}

postman-config-file-managed-environ_file:
  file.managed:
    - name: {{ postman.environ_file }}
    - source: {{ files_switch(['environ.sh.jinja'],
                              lookup='postman-config-file-managed-environ_file'
                 )
              }}
    - mode: 640
    - user: {{ postman.rootuser }}
    - group: {{ postman.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        path: {{ postman.config.path|json }}
        environ: {{ postman.environ|json }}
    - require:
      - sls: {{ sls_package_install }}

    {%- endif %}
