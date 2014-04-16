{% if grains['os'] == 'Gentoo' %}
spotify-deps:
  portage_config.flags:
    - names:
      - dev-qt/qtcore
      - dev-qt/qtgui
      - dev-qt/qtsql
      - dev-qt/qtopengl
    - use:
      - qt3support
{% endif %}

spotify:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:spotify', 'spotify-client') }}
  {% if grains['os'] == 'Gentoo' %}
    - require:
      - portage_config: spotify-deps
  {% endif %}
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - keyserver: keyserver.ubuntu.com
    - keyid: 94558F59
    - require_in:
      - pkg: spotify
  {% elif grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:spotify', 'spotify-client') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: spotify
  {% endif %}
