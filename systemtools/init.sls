
systemtools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:screen', 'screen') }}
      - {{ salt['pillar.get']('pkgs:tmux', 'tmux') }}
      - {{ salt['pillar.get']('pkgs:dos2unix', 'dos2unix') }}
      - {{ salt['pillar.get']('pkgs:tree', 'tree') }}
      - {{ salt['pillar.get']('pkgs:strace', 'strace') }}
      - {{ salt['pillar.get']('pkgs:iftop', 'iftop') }}
      - {{ salt['pillar.get']('pkgs:netcat', 'netcat') }}
      - {{ salt['pillar.get']('pkgs:nmap', 'nmap') }}
      - {{ salt['pillar.get']('pkgs:tcpdump', 'tcpdump') }}
      - {{ salt['pillar.get']('pkgs:bwm-ng', 'bwm-ng') }}
      - {{ salt['pillar.get']('pkgs:iptables', 'iptables') }}
      - {{ salt['pillar.get']('pkgs:bridge-utils', 'bridge-utils') }}
      - {{ salt['pillar.get']('pkgs:stunnel', 'stunnel') }}
      - {{ salt['pillar.get']('pkgs:hwinfo', 'hwinfo') }}
      - {{ salt['pillar.get']('pkgs:lshw', 'lshw') }}
      - {{ salt['pillar.get']('pkgs:pciutils', 'pciutils') }}
      - {{ salt['pillar.get']('pkgs:usbutils', 'usbutils') }}
      - {{ salt['pillar.get']('pkgs:usermode-utilities', 'usermode-utilities') }}
      - {{ salt['pillar.get']('pkgs:bc', 'bc') }}
      - {{ salt['pillar.get']('pkgs:dfc', 'dfc') }}
      - {{ salt['pillar.get']('pkgs:lsscsi', 'lsscsi') }}
      - {{ salt['pillar.get']('pkgs:iotop', 'iotop') }}
      - {{ salt['pillar.get']('pkgs:lsof', 'lsof') }}
      - {{ salt['pillar.get']('pkgs:ack', 'ack') }}
      - {{ salt['pillar.get']('pkgs:dmidecode', 'dmidecode') }}

fstools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:dosfstools', 'dosfstools') }}
      - {{ salt['pillar.get']('pkgs:mtpfs', 'mtpfs') }}
      - {{ salt['pillar.get']('pkgs:ntfs3g', 'ntfs3g') }}
      - {{ salt['pillar.get']('pkgs:sysfsutils', 'sysfsutils') }}
      - {{ salt['pillar.get']('pkgs:xfsprogs', 'xfsprogs') }}
