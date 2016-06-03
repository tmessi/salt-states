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
    - names: {{ salt['pillar.get']('pkgs:x11progs') }}

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
