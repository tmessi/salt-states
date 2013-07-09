{% if grains['os'] == 'Gentoo' %}
include:
  - flash.gentoo
{% endif %}

flash:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:flash', 'flash') }}
    {% if grains['os'] == 'Gentoo' %}
    - uses: '[32bit,64bit]'
    - requires:
      - portage_config: {{ salt['pillar.get']('pkgs:flash') }}
    {% endif %}
