spectrwm-flags:
  portage_config.flags:
    - name: x11-wm/spectrwm
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: x11progs

urxvt-flags:
  portage_config.flags:
    - name: x11-terms/rxvt-unicode
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

x11progs:
  pkg.installed:
    - names:
      - x11-apps/xev
      - x11-apps/xfontsel
      - x11-apps/xrandr
      - x11-base/xorg-server
      - x11-misc/dmenu
      - x11-misc/dzen
      - x11-misc/xautolock
      - x11-misc/xbindkeys
      - x11-misc/xclip
      - x11-misc/xcompmgr
      - x11-misc/xlockmore
      - x11-terms/rxvt-unicode
      - x11-misc/urxvt-perls
      - x11-misc/hsetroot
      - x11-apps/transset
      - x11-wm/spectrwm
      - x11-terms/xterm
      - x11-apps/mesa-progs
      - x11-misc/read-edid
      - x11-themes/vanilla-dmz-xcursors

/etc/spectrwm.conf:
  file.managed:
    - source: salt://x11progs/spectrwm.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: x11progs

{% if 'xorg.conf' in pillar %}
/etc/X11/xorg.conf:
  file.managed:
    - contents_pillar: xorg.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: x11progs
{% endif %}
