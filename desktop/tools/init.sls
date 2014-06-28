desktoptools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:feh', 'feh') }}
