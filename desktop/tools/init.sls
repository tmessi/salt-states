{% if grains['os'] == 'Gentoo' %}
googletalk-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:googletalk', 'google-talkplugin') }}
    - accept_keywords:
      - ~ARCH
    - license:
      - Google-TOS
    - require_in:
      - pkg: desktoptools
{% endif %}

desktoptools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:feh', 'feh') }}
      - {{ salt['pillar.get']('pkgs:pavucontrol', 'pavucontrol') }}
      - {{ salt['pillar.get']('pkgs:googletalk', 'google-talkplugin') }}
      - {{ salt['pillar.get']('pkgs:ntp', 'ntp') }}

ntpd:
  service.running:
    - enable: True
    - require:
      - pkg: desktoptools
