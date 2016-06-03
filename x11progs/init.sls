{% if grains['os'] == 'Gentoo' %}
spectrwm-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:spectrwm', 'spectrwm') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: x11progs

urxvt-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:rxvt-unicode', 'rxvt-unicode') }}
    - use:
      - '256-color'
      - 'blink'
      - 'fading-colors'
      - 'perl'
      - 'xft'
      - 'font-styles'
      - 'unicode3'
      - '-focused-urgency'
      - '-vanilla'
    - require_in:
      - pkg: x11progs
{% endif %}


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
      - {{ salt['pillar.get']('pkgs:xterm', 'xterm') }}
      - {{ salt['pillar.get']('pkgs:terminus', 'terminus') }}

/etc/spectrwm.conf:
  file.managed:
    - source: salt://x11progs/spectrwm.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: x11progs

{% if xorg.conf in pillar %}
/etc/X11/xorg.conf:
  file.managed:
    - contents_pillar: xorg.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: x11progs
{% endif %}
