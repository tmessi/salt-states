base:
  '*':
    - core
    # shadowfax-chc/users-formula
    - users
  'os:Gentoo':
    - match: grain
    - gentoo
  'os:Ubuntu':
    - match: grain
    - ubuntu
  'brego':
    - desktop
    - media
  'felarof*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
    - noip
  'snowmane*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
