include:
  - nginx
  - users

/etc/nginx/sites-available/vidplayer.conf:
  file.managed:
    - source: salt://media/vidplayer/nginx-template.conf
    - template: jinja
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/sites-enabled/vidplayer.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/vidplayer.conf
    - require:
      - file: /etc/nginx/sites-available/vidplayer.conf
