base:
  '*':
    - core
    # shadowfax-chc/users-formula
    - users
  'os:Gentoo':
    - match: grain
    - gentoo
  'brego':
    - desktop
    - media
  'felarof*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
  'snowmane*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
