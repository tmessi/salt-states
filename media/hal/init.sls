hal:
  pkg.installed:
    - name: hal
  pkgrepo.managed:
    - ppa: mjblenner/ppa-hal
    - require_in:
      - pkg: hal
