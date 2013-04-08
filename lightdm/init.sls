lightdm:
  pkg:
    - installed

/etc/lightdm/lightdm.conf:
  file.append:
    - text: allow-guest=false
    - require:
      - pkg: lightdm
