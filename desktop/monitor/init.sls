conky-flags:
  portage_config.flags:
    - name: app-admin/conky
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
      - portmon
      - rss
      - weather-metar
      - weather-xoap
      - wifi
    - require_in:
      - pkg: conky

conky:
  pkg.installed:
    - name: app-admin/conky

hddtemp:
  service.running:
    - name: hddtemp
    - enable: True
    - require:
      - pkg: conky
