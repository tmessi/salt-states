#!/bin/bash -e

source /srv/vidplayer/vidplayer_env

LOGFILE=/srv/vidplayer/uwsgi.log
LOGDIR=$(dirname $LOGFILE)

cd /srv/vidplayer/project/vidplayer
source /srv/vidplayer/env/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec uwsgi --ini /srv/vidplayer/uwsgi.ini 2>>$LOGFILE
