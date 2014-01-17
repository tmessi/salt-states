{% for conf, values in pillar.get('makeconf').items() %}
{% for value in values %}
{{ conf }}_{{ value }}:
  makeconf.present:
    - name: {{ conf }}
    - contains: '{{ value }}'
{% endfor %}
{% endfor %}
