{% for conf, values in salt['pillar.get']('makeconf')|dictsort %}
{% for value in values %}
{{ conf }}_{{ value }}:
  makeconf.present:
    - name: {{ conf }}
    - contains: '{{ value }}'
{% endfor %}
{% endfor %}

/etc/portage/repos.conf/gentoo.conf:
  file.managed:
    - source: salt://gentoo/gentoo.conf
    - template: jinja
    - mode: 644
    - makedirs: True
    - dir_mode: 755

{% for conf in salt['pillar.get']('makeconf_absent') %}
{{ conf }}_absent:
  makeconf.absent:
    - name: {{ conf }}
{% endfor %}
