solaar:
  pkg.installed:
    - require:
      - pkgrepo: solaar
  pkgrepo.managed:
    - ppa: daniel.pavel/solaar
