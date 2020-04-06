# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import postman with context %}

include:
  - .newman.clean
  - .archive.clean
  - .config.clean
