pithos:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:pithos', 'pithos') }}
  {% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:pithos', 'pithos') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: pithos
  {% endif %}

