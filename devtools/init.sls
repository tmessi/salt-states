include:
  - gentools

vcs:
  pkg.installed:
    - names:
      - dev-vcs/mercurial
      - dev-vcs/git

vagrant:
  pkg.installed:
    - name: app-emulation/vagrant-bin
    - require:
      - layman: shadowfax-overlay
  portage_config.flags:
    - name: app-emulation/vagrant-bin
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: vagrant


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

consul:
  pkg.installed:
    - name: app-admin/consul
  portage_config.flags:
    - name: app-admin/consul
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: consul


packer:
  pkg.installed:
    - name: app-misc/packer-bin
    - require:
      - layman: shadowfax-overlay
  portage_config.flags:
    - name: app-misc/packer-bin
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: packer


otto:
  pkg.installed:
    - name: app-misc/otto-bin
    - require:
      - pkg: consul
      - pkg: packer
      - pkg: vagrant
      - layman: shadowfax-overlay
  portage_config.flags:
    - name: app-misc/otto-bin
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: otto


virtualbox:
  pkg.installed:
    - name: app-emulation/virtualbox
    - require_in:
      - pkg: vagrant
  portage_config.flags:
    - name: app-emulation/virtualbox
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


python-tools:
  pkg.installed:
    - names:
      - dev-python/flake8
      - dev-python/pep8
      - dev-python/virtualenv
      - dev-python/jedi
      - dev-python/tox
      - dev-python/pip
      - dev-python/ipython
      - dev-python/django
      - dev-python/pylint
  portage_config.flags:
    - names:
      - dev-python/tox
      - dev-python/pylint
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
  pip.installed:
    - names:
      - django
      - pylint
    - require:
      - pkg: python-tools

go:
  pkg.installed:
    - names:
      - dev-lang/go

services:
  pkg.installed:
    - names:
      - net-misc/rabbitmq-server

ruby-tools:
  pkg.installed:
    - names:
      - dev-ruby/rake

libseccomp:
  portage_config.flags:
    - name: sys-libs/libseccomp
    - use:
      - static-libs
    - require_in:
      - pkg: docker

docker:
  pkg.installed:
    - names:
      - app-emulation/docker
