mplayer:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:mplayer', 'mplayer') }}

