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
    - dev
    - games
  'snowmane*':
    - dev
  'anduril*':
    - dev
    - laptop
  'glamdring*':
    - dev
    - laptop
