{% if grains['os'] == 'Gentoo' %}
googletalk-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:googletalk', 'google-talkplugin') }}
    - accept_keywords:
      - '**'
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
      - {{ salt['pillar.get']('pkgs:gimp', 'gimp') }}
      - {{ salt['pillar.get']('pkgs:scrot', 'scrot') }}

ntpd:
  service.running:
    - enable: True
    - require:
      - pkg: desktoptools
