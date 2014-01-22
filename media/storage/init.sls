{% for name, raid in pillar.get('storage', {})|dictsort %}
{{ name }}:
  raid.present:
    - opts:
      - level={{ raid['level'] }}
      - raid-devices={{ raid['devices']|count }}
      {% for device in raid['devices'] %}
      - {{ device}}
      {% endfor %}

{{ raid['mount_point' }}:
  mount.mounted:
    - device: {{ name }}
    - fstype: {{ raid['fstype'] }}
    - mkmnt: True
    - opts:
      {% for opt in raid['mount_opts'] %}
      - {{ opt }}
      {% endfor %}
    - require:
      - raid: {{ name }}
{% endfor %}
