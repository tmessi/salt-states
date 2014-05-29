include:
  - users

{% for name, repo in salt['pillar.get']('repos', {}).items() %}
{{ repo['destination'] }}:
  file.directory:
    - user: {{ repo['user'] }}
    - group: {{ repo['user'] }}
    - makedirs: True
    - require:
      - user: {{ repo['user'] }}_user

{{ name }}:
  git.latest:
    - name: {{ repo['repository'] }}
    - target: {{ repo['destination'] }}
    - rev: {{ repo.get('rev', 'master') }}
    - user: {{ repo['user'] }}
    - require:
      - file: {{ repo['destination'] }}

{% if 'post_cmd' in repo %}
{{ repo['post_cmd'] }}_{{ name }}:
  cmd.wait:
    - name: {{ repo['post_cmd'] }}
    - user: {{ repo['user'] }}
    - cwd: {{ repo['destination'] }}
    - watch:
      - git: {{ name }}
{% endif %}
{% endfor %}

