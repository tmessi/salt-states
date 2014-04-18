solaar:
  pkg.installed:
    - names:
      - solaar
      - solaar-gnome3
    - require:
      - pkgrepo: solaar
  pkgrepo.managed:
    - ppa: daniel.pavel/solaar
