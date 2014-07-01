include:
  - desktop
  - desktop.monitor
  - desktop.tools
  - devtools
  - systemtools
  - x11progs
  - repos
{% if grains['os'] == 'Gentoo' %}
  - gentools
{% endif %}
