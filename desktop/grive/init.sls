{% if grains['os'] == 'Gentoo' %}
include:
  - devtools
{% endif %}

grive:
  pkg.purged:
    - name: {{ salt['pillar.get']('pkgs:grive', 'grive') }}
{% if grains['os'] == 'Ubuntu' %}
  pkgrepo.absent:
    - ppa: nilarimogard/webupd8
    - require_in:
      - pkg: grive
{% endif %}

drive:
{% if grains['os'] == 'Ubuntu' %}
  pkg.installed:
    - require:
      - pkgrepo: drive
  pkgrepo.managed:
    - ppa: twodopeshaggy/drive
{% elif grains['os'] == 'Gentoo' %}
  cmd.run:
    - name: 'go get -u github.com/odeke-em/drive/cmd/drive'
    - user: tim
    - env:
      - GOPATH: /home/tim/go
    - unless: 'test -f /home/tim/go/bin/drive'
    - require:
      - pkg: go
{% endif %}

sync_grive:
  cron.present:
    - name: /home/tim/bin/syncgrive
    - user: tim
    - minute: '*/15'
