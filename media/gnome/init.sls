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

/usr/share/themes/Adwaita/metacity-1/metacity-theme-3.xml:
  file.patch:
    - source: salt://media/gnome/metacity-theme-3.xml.patch
    - hash: md5=4346533324e2f7e95a0d3cbffe78e56f
