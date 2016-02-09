include:
  - gentools

{% if grains['os'] == 'Gentoo' %}
gamerlay:
  layman.present:
    - require:
      - file: /etc/layman/layman.cfg
{% endif %}

steam:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:steam', 'steam') }}
  {% if grains['os'] == 'Gentoo' %}
    - require:
      - layman: gamerlay
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:steam', 'steam') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: steam
  {% endif %}

/etc/udev/rules.d/99-joystick.rules:
  file.managed:
    - source: salt://games/99-joystick.rules
    - mode: 644
    - user: root
    - group: root
