gnome:
  pkg.installed:
    - pkgs:
      - gnome-shell
      - ubuntu-gnome-desktop
      - require:
        - debconf: gdm
  pkgrepo.managed:
    - ppa: gnome3-team/gnome3
    - require_in:
      - pkg: gnome

gdm:
  debconf.set:
    - name: gdm
    - data:
        'shared/default-x-display-manager': {'type': 'string', 'value': 'gdm'}
