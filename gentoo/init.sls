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
