{{ pillar['usr'] }}:
  user.present:
    - uid: 1000
    - gid: 1000
    - groups: {{ pillar['grps'] }}
    - require:
      - group: groups

groups:
  group.present:
    names:
      {{ pillar['grps'] }}
