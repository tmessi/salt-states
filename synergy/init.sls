{% if grains['os'] == 'Ubuntu' %}
include:
  - lightdm
{% endif %} 

synergy:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:synergy', 'synergy') }}

{% if grains['os'] == 'Ubuntu' %}
startup:
  file.append:
    - name: /etc/lightdm/lightdm.conf
    - text: session-setup-script=/usr/bin/synergyc firefoot
    - require:
      - pkg: lightdm
{% endif %}
