
gentools:
  pkg.installed:
    - names:
      - app-portage/eix
      - app-portage/elogv
      - app-portage/gentoolkit
      - app-portage/layman

app-portage/layman:
  portage_config.flags:
    - use:
      - git
      - subversion
      - mercurial
    - require_in:
      - pkg: gentools

app-portage/eix:
  portage_config.flags:
    - use:
      - optimization
      - strong-optimization
    - require_in:
      - pkg: gentools
