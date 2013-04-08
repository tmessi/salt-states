synergy:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:synergy', 'synergy') }}

{% if grains['os'] == 'Ubuntu' %}
/etc/lightdm/lightdm.conf:
  file.append:
    - text: session-setup-script=/usr/bin/synergyc firefoot
    - require:
      - pkg: lightdm
{% endif %}
