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
    - watch_in:
      - service: nginx

bitbucket.org:
  ssh_known_hosts.present:
    - user: vidplayer
    - fingerprint: 97:8c:1b:f2:6f:14:6b:5c:3b:ec:aa:46:46:74:7c:40
    - require:
      - user: vidplayer_user

python-dev:
  pkg:
    - installed

virtualenv:
  pkg.installed:
    - name: python-virtualenv

vidplayer_dir:
  file.directory:
    - names:
      - /srv/vidplayer/project
    - user: vidplayer
    - mode: 755
    - require:
      - user: vidplayer_user

vidplayer_source:
  git.latest:
    - name: ssh://git@bitbucket.org/tmessier/vidplayer
    - target: /srv/vidplayer/project/vidplayer
    - user: vidplayer
    - rev: {{ pillar.get('rev', 'master') }}
    - require:
      - file: vidplayer_dir
      - ssh_known_hosts: bitbucket.org

/srv/vidplayer/env:
  virtualenv.managed:
    - requirements: /srv/vidplayer/project/vidplayer/requirements.txt
    - user: vidplayer
    - require:
      - pkg: virtualenv
      - pkg: python-dev
      - git: vidplayer_source

/srv/vidplayer/startvidplayer.sh:
  file.managed:
    - source: salt://media/vidplayer/startvidplayer.sh
    - template: jinja
    - user: vidplayer
    - group: www-data
    - mode: 755

/srv/vidplayer/uwsgi.ini:
  file.managed:
    - source: salt://media/vidplayer/uwsgi.ini
    - template: jinja
    - user: vidplayer
    - group: www-data
    - mode: 644

/etc/init/vidplayer.conf:
  file.managed:
    - source: salt://media/vidplayer/vidplayer.upstart
    - template: jinja
    - require:
      - file: /srv/vidplayer/startvidplayer.sh

/etc/init.d/vidplayer:
  file.symlink:
    - target: /lib/init/upstart-job
    - require:
      - file: /etc/init/vidplayer.conf

collect_static:
  cmd.wait:
    - name: 'source /srv/vidplayer/env/bin/activate && python manage.py collectstatic --link --noinput'
    - user: vidplayer
    - cwd: /srv/vidplayer/project/vidplayer
    - require:
      - virtualenv: /srv/vidplayer/env
    - watch:
      - git: vidplayer_source

vidplayer:
  service.running:
    - enable: True
    - require:
      -  file: /etc/init.d/vidplayer
    - watch:
      - file: /srv/vidplayer/uwsgi.ini
      - git: vidplayer_source

nopip-updater:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkg:noip-updater', 'noip2') }}
