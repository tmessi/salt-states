{{ pillar['usr'] }}:
  user.present:
    - uid: 1000
    - gid: 1000
    - groups: {{ pillar['grps'] }}

vagrant:
  user.absent
