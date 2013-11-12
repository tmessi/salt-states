mplayer:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:mplayer', 'mplayer') }}
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:mplayer', 'mplayer') }}
    - use:
      - libass
      - bluray
      - cdio
      - cdparanoia
      - dvdnav
      - faac
      - gsm
      - mng
      - nas
      - network
      - nut
      - osdmenu
      - pnm
      - rtmp
      - shm
      - targa
      - xanim
      - xvid
      - xvmc
      - zoran
    - require_in:
      - pkg: mplayer
{% endif %}
