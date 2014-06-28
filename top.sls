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
    - systemtools
    - media
  'felarof*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
    - noip
    - repos
  'lightfoot*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
    - repos
  'snowmane*':
    - desktop
    - devtools
    - gentools
    - systemtools
    - x11progs
