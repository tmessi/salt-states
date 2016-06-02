{% if salt['pillar.get']('fortune-mods') %}
fortune-mod:
  pkg.installed:
    - names: {{ salt['pillar.get']('fortune-mods') }}
{% endif %}
