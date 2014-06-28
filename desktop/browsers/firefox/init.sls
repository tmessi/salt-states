include:
  - desktop.flash

{% if grains['os'] == 'Gentoo' %}
python-flags:
  portage_config.flags:
    - name: dev-lang/python
    - use:
      - sqlite
    - require_in:
      - pkg: firefox

libpng-flags:
  portage_config.flags:
    - name: media-libs/libpng
    - use:
      - apng
    - require_in:
      - pkg: firefox
{% endif %}

firefox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:firefox', 'firefox') }}
    - require:
      - pkg: flash
