spotify:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:spotify', 'spotify') }}
  {% if grains['os'] == 'Ubuntu' %}
    - require:
      - pkgrepo: spotify
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - keyserver: keyserver.ubuntu.com
    - keyid: 4E9CFF4E
  {% endif %}
