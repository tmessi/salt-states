dropbox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:dropbox', 'nautilus-dropbox') }}
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:dropbox', 'nautilus-dropbox') }}
    - accept_keywords:
      - ~ARCH
{% endif %}
