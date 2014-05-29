
x11progs:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:xev', 'xev') }}
      - {{ salt['pillar.get']('pkgs:xfontsel', 'xfontsel') }}
      - {{ salt['pillar.get']('pkgs:xrandr', 'xrandr') }}
      - {{ salt['pillar.get']('pkgs:xorg-server', 'xorg-server') }}
      - {{ salt['pillar.get']('pkgs:dmenu', 'dmenu') }}
      - {{ salt['pillar.get']('pkgs:dzen', 'dzen') }}
      - {{ salt['pillar.get']('pkgs:xautolock', 'xautolock') }}
      - {{ salt['pillar.get']('pkgs:xbindkeys', 'xbindkeys') }}
      - {{ salt['pillar.get']('pkgs:xclip', 'xclip') }}
      - {{ salt['pillar.get']('pkgs:xcompmgr', 'xcompmgr') }}
      - {{ salt['pillar.get']('pkgs:xlockmore', 'xlockmore') }}
      - {{ salt['pillar.get']('pkgs:rxvt-unicode', 'rxvt-unicode') }}
      - {{ salt['pillar.get']('pkgs:urxvt-perls', 'urxvt-perls') }}
      - {{ salt['pillar.get']('pkgs:hsetroot', 'hsetroot') }}
      - {{ salt['pillar.get']('pkgs:transset', 'transset') }}
      - {{ salt['pillar.get']('pkgs:spectrwm', 'spectrwm') }}

/etc/spectrwm.conf:
  file.managed:
    - source: salt://x11progs/spectrwm.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: x11progs
