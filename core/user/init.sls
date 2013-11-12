{{ pillar['usr'] }}:
  user.present:
    - uid: 1000
    - gid: 1000
    - groups: {{ pillar['grps'] }}

groups:
  group.present:
    - names: {{ pillar['grps'] }}
    - require_in:
      - user: {{ pillar['usr'] }}
