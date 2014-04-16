flash:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:flash', 'flash-installer') }}
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:flash', 'flash-installer') }}
    - license: 
      - 'AdobeFlash-11.x'
    - use:
      - 32bit
      - 64bit
    - require_in:
      - pkg: flash
{% endif %}
