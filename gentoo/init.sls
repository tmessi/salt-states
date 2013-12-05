makeopts:
  makeconf.present:
    - value: '-j{{ grains['num_cpus'] + 1 }} -l{{ grains['num_cpus'] * 1.5 }}'

portage_elog_classes:
  makeconf.present:
    - value: 'info qa warn log error'

portage_elog_system:
  makeconf.present:
    - value: 'echo:qa,error save'

portage_niceness:
  makeconf.present:
    - value: '10'

emerge_default_opts:
  makeconf.present:
    - value: '--jobs --load-average={{ grains['num_cpus'] * 1.5 }}'

input_devices:
  makeconf.present:
    - value: 'evdev'

video_cards:
  makeconf.present:
    - value: {{ pillar['videocards'] }}

alsa_cards:
  makeconf.present:
    - value: 'hda-intel'

features:
  makeconf.present:
    - value: 'parallel-fetch parallel-install candy'

gentoo_mirrors:
  makeconf.present:
    - value: 'http://distfiles.gentoo.org http://www.ibiblio.org/pub/Linux/distributions/gentoo'

sync:
  makeconf.present:
    - value: 'rsync://rsync.namerica.gentoo.org/gentoo-portage'

portdir_overlay:
  makeconf.present:
    - value: '/usr/local/portage'

python_targets:
  makeconf.present:
    - value: 'python2_7'

use_python:
  makeconf.present:
    - value: '2.7'

ruby_targets:
  makeconf.present:
    - value: 'ruby18 ruby19'

use:
  makeconf.present:
    - value: 'bluray libnotify a52 aac aalib acpi aim alsa ao audiofile bash-completion berkdb bzip2 cdr cscope css ctype cups cvs cxx custom-optimization dbus dga dri dvd dvdr ffmpeg flac consolekit fontconfig fortran gcj gif glut gpm gzip jabber jpeg lame lzma lzo ldap mad mmx mp3 mp4 mpeg mpi mplayer multilib ncurses openal opengl openmp png quicktime raw -samba sdl shorten smp sound sse sse2 sse3 ssse3 syslog tcpd threads tiff truetype udev usb v4l v4l2 vcd videos vim-syntax vorbis ogg wavpack win32codecs X xcb xinerama offensive -introspection acl -avahi -doc -emacs -gnome -gtk -hardened -ibm -kde -kerberos -nls -pcmcia -policykit pulseaudio -qt4 -qt unicode -xemacs vdpau -zeroconf opus'
