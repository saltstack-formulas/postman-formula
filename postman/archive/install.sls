# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

postman-package-archive-install-extract:
  pkg.installed:
    - names: {{ postman.pkg.deps|json }}

        {%- if grains.os != 'MacOS' %}
  file.directory:
    - name: {{ postman.config.path }}
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
        {%- endif %}

  archive.extracted:
    {{- format_kwargs(postman.pkg.archive) }}
    - archive_format: {{ postman.pkg.format }}
    - retry: {{ postman.retry_option }}
    - user: {{ postman.rootuser }}
    - group: {{ postman.rootgroup }}
       {%- if grains.kernel|lower == 'linux' %}
    - enforce_toplevel: false
    - options: '--strip-components=1'
       {%- endif %}
