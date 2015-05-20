vidplayer:
  service.stopped:
    - enable: False
  user.absent:
    - purge: true

/etc/nginx/sites-available/vidplayer.conf:
  file:
    - absent

/etc/nginx/sites-enabled/vidplayer.conf:
  file:
    - absent

/srv/vidplayer:
  file.absent:
    - names:

/etc/init/vidplayer.conf:
  file:
    - absent

/etc/init.d/vidplayer:
  file:
    - absent
