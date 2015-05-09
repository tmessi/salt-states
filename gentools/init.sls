
gentools:
  pkg.installed:
    - names:
      - app-portage/eix
      - app-portage/elogv
      - app-portage/gentoolkit
      - app-portage/layman
      - app-shells/bash-completion

app-portage/layman:
  portage_config.flags:
    - use:
      - git
      - subversion
      - mercurial
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: gentools

app-portage/eix:
  portage_config.flags:
    - use:
      - optimization
      - strong-optimization
    - require_in:
      - pkg: gentools

/etc/layman/layman.cfg:
  file.managed:
    - source: salt://gentools/layman.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: gentools

shadowfax-overlay:
  layman.present:
    - require:
      - file: /etc/layman/layman.cfg
