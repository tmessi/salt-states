{% if grains['os'] == 'Ubuntu' %}
include:
  - gnome
{% endif %} 

synergy:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:synergy', 'synergy') }}

{% if grains['os'] == 'Ubuntu' %}
startup:
  file.append:
    - name: /etc/gdm/PreSession/Default
    - text: /usr/bin/synergyc firefoot
    - require:
      - pkg: gnome
{% endif %}
