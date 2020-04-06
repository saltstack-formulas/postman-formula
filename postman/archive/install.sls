# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

postman-package-archive-install-extract:
  pkg.installed:
    - names:
      - curl
      - zip
  file.directory:
    - name: {{ postman.pkg.archive.name }}
    - user: {{ postman.rootuser }}
    - group: {{ postman.rootgroup }}
    - mode: 755
    - makedirs: True
    - require_in:
      - archive: postman-package-archive-install-extract
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(postman.pkg.archive) }}
    - retry:a {{ postman.retry_option }}
    - user: {{ postman.rootuser }}
    - group: {{ postman.rootgroup }}
