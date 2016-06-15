googletalk-flags:
  portage_config.flags:
    - name: www-plugins/google-talkplugin
    - accept_keywords:
      - '**'
    - license:
      - Google-TOS
    - require_in:
      - pkg: desktoptools

poppler:
  portage_config.flags:
    - name: app-text/poppler
    - use:
      - cairo
    - require_in:
      - pkg: desktoptools

desktoptools:
  pkg.installed:
    - names:
      - media-gfx/feh
      - media-sound/pavucontrol
      - www-plugins/google-talkplugin
      - net-misc/ntp
      - media-gfx/gimp
      - media-gfx/scrot
      - app-text/apvlv
      - media-gfx/gphoto2
      - net-print/hplip

ntpd:
  service.running:
    - enable: True
    - require:
      - pkg: desktoptools
