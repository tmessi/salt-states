{% for name, raid in pillar.get('storage', {})|dictsort %}
{{ name }}:
  raid.present:
    - level: {{ raid['level'] }}
    - devices:
      {% for device in raid['devices'] %}
      - {{ device}}
      {% endfor %}

{{ name }}_mkfs:
  cmd.run:
    - name: mkfs.{{ raid['fstype'] }} {{ raid['mount_dev'] }} -L {{ raid['label'] }}
    - unless: 'test "$(blkid {{ raid['mount_dev'] }} -s TYPE -o value)" == "{{ raid['fstype'] }}"'
    - require:
      - raid: {{ name }}

{{ raid['mount_point'] }}:
  mount.mounted:
    - device: {{ raid['mount_dev'] }}
    - fstype: {{ raid['fstype'] }}
    - mkmnt: True
    - opts:
      {% for opt in raid['mount_opts'] %}
      - {{ opt }}
      {% endfor %}
    - require:
      - raid: {{ name }}
      - cmd: {{ name }}_mkfs
{% endfor %}
