# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}
{%- set p = postman.pkg %}

include:
  - .archive
  - .config
  - .newman
