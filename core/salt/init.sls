salt-minion:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:salt-minion', 'salt-minion') }}
{% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: saltstack/salt
    - require_in:
      - pkg: salt-minion
{% elif grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:salt-minion', 'salt-minion') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: salt-minion
{% endif %}
