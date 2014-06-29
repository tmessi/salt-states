desktoptools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:feh', 'feh') }}
      - {{ salt['pillar.get']('pkgs:pavucontrol', 'pavucontrol') }}
      - {{ salt['pillar.get']('pkgs:googletalk', 'google-talkplugin') }}
