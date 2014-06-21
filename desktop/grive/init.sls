grive:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:grive', 'grive') }}
{% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: nilarimogard/webupd8
    - require_in:
      - pkg: grive
{% elif grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:grive', 'grive') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: grive
{% endif %}

sync_grive:
  cron.present:
    - name: /home/tim/bin/syncgrive
    - user: tim
    - minute: '*/15'
