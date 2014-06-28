{% if grains['os'] == 'Gentoo' %}
conky-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:conky', 'conky') }}
    - use:
      - curl
      - hddtemp
      - imlib
      - iostats
      - lua
      - lua-cairo
      - lua-imlib
      - math
      - mpd
      - ncurses
      - nvidia
      - portmon
      - rss
      - weather-metar
      - weather-xoap
      - wifi
    - require_in:
      - pkg: conky
{% endif %}

conky:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:conky', 'conky') }}

hddtemp:
  service.running:
    - name: {{ salt['pillar.get']('services:hddtemp', 'hddtemp') }}
    - enable: True
    - require:
      - pkg: conky
