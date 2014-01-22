/dev/md127:
  raid.present:
    - opts:
      - level=1
      - raid-devices=2
      - /dev/sdc1
      - /dev/sdd1

/media/storage:
  mount.mounted:
    - device: /dev/md127
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
