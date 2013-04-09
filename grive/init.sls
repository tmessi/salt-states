grive:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:grive', 'grive') }}
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: nilarimogard/webupd8
    - require_in:
      - pkg: grive
  {% endif %}
