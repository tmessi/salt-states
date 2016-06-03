{% if grains['os'] == 'Gentoo' %}
include:
  - gentools
{% endif %}

vcs:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:mercurial', 'mercurial') }}
      - {{ salt['pillar.get']('pkgs:git', 'git') }}

vagrant:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vagrant', 'vagrant') }}
  {% if grains['os'] == 'Gentoo' %}
    - require:
      - layman: shadowfax-overlay
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:vagrant', 'vagrant') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: vagrant
  {% endif %}

{% if grains['os'] == 'Gentoo' %}
consul-deps:
  portage_config.flags:
    - names:
      - dev-go/go-text
      - dev-go/go-tools
      - dev-go/go-sys
      - dev-go/go-net
      - dev-go/go-crypto
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: consul
{% endif %}

consul:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:consul', 'consul') }}
  {% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:consul', 'consul') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: consul
  {% endif %}

otto:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:otto', 'otto') }}
    - require:
      - pkg: consul
      - pkg: vagrant
  {% if grains['os'] == 'Gentoo' %}
      - layman: shadowfax-overlay
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:otto', 'otto') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: otto
  {% endif %}

virtualbox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:virtualbox', 'virtualbox') }}
    - require_in:
      - pkg: vagrant
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:virtualbox', 'virtualbox') }}
    - accept_keywords:
      - ~ARCH
    - use:
      - additions
      - extensions
      - qt4
    - require_in:
      - pkg: virtualbox

virtualbox-deps:
  portage_config.flags:
    - names: 
      - app-emulation/virtualbox-additions
      - app-emulation/virtualbox-extpack-oracle
      - app-emulation/virtualbox-modules
      - dev-util/kbuild
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: virtualbox

virutalbox-licenses:
  portage_config.flags:
    - names:
      - app-emulation/virtualbox-additions
      - app-emulation/virtualbox-extpack-oracle
    - license:
      - PUEL
    - require_in:
      - pkg: virtualbox
{% endif %}

python-tools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:flake8', 'flake8') }}
      - {{ salt['pillar.get']('pkgs:pep8', 'pep8') }}
      - {{ salt['pillar.get']('pkgs:virtualenv', 'virtualenv') }}
      - {{ salt['pillar.get']('pkgs:jedi', 'jedi') }}
      - {{ salt['pillar.get']('pkgs:tox', 'tox') }}
      - {{ salt['pillar.get']('pkgs:pip', 'pip') }}
      - {{ salt['pillar.get']('pkgs:ipython', 'ipython') }}
  {% if grains['os'] == 'Gentoo' %}
      - {{ salt['pillar.get']('pkgs:django', 'django') }}
      - {{ salt['pillar.get']('pkgs:pylint', 'pylint') }}
  portage_config.flags:
    - names:
      - {{ salt['pillar.get']('pkgs:tox', 'tox') }}
      - {{ salt['pillar.get']('pkgs:pylint', 'pylint') }}
      - dev-python/py
      - dev-python/astroid
      - dev-python/virtualenv
      - dev-python/lazy-object-proxy
      - dev-python/pluggy
      - dev-python/setuptools
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: python-tools
  {% else %}
  pip.installed:
    - names:
      - django
      - pylint
    - require:
      - pkg: python-tools
  {% endif %}

go:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:go', 'go') }}

services:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:rabbitmq-server', 'rabbitmq-server') }}

ruby-tools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:rake', 'rake') }}

docker:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:docker', 'docker-engine') }}
  service.running:
    - enable: True
    - require:
      - pkg: docker
