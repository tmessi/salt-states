vcs:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:mercurial', 'mercurial') }}
      - {{ salt['pillar.get']('pkgs:git', 'git') }}

vagrant:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vagrant', 'vagrant') }}
  {% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:vagrant', 'vagrant') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: vagrant
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
      - {{ salt['pillar.get']('pkgs:pylint', 'pylint') }}
      - {{ salt['pillar.get']('pkgs:flake8', 'flake8') }}
      - {{ salt['pillar.get']('pkgs:pep8', 'pep8') }}
      - {{ salt['pillar.get']('pkgs:virtualenv', 'virtualenv') }}
      - {{ salt['pillar.get']('pkgs:jedi', 'jedi') }}
      - {{ salt['pillar.get']('pkgs:tox', 'tox') }}
      - {{ salt['pillar.get']('pkgs:pip', 'pip') }}
  {% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - names:
      - {{ salt['pillar.get']('pkgs:tox', 'tox') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: python-tools
  {% endif %}
