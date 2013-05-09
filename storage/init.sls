/dev/md0:
  raid.present:
    - opts:
      - level=1
      - raid-devices=2
      - /dev/sdb1
      - missing

/media/storage:
  mount.mounted:
    - device: /dev/md0
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
    - require:
      - raid: /dev/md0
