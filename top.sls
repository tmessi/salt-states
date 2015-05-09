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
    - noip
  'snowmane*':
    - dev
  'anduril*':
    - dev
    - laptop
