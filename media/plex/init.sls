
plexmediaserver:
  pkg.installed:
    - sources:
      - plexmediaserver: https://downloads.plex.tv/plex-media-server/0.9.12.1.1079-b655370/plexmediaserver_0.9.12.1.1079-b655370_amd64.deb
  service.running:
    - enable: True

/etc/default/plexmediaserver:
  file.managed:
    - source: salt://media/plex/plex.default
    - temaplte: jinja
    - require:
      - pkg: plexmediaserver
    - watch_inf:
      - service: plexmediaserver
