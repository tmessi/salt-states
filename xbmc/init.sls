xbmc:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:xbmc', 'xbmc') }}
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: xbmc
  {% endif %}

