dfc-flags:
  portage_config.flags:
    - name: sys-fs/dfc
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: systemtools

systemtools:
  pkg.installed:
    - names:
      - app-misc/screen
      - app-misc/tmux
      - app-text/dos2unix
      - app-text/tree
      - dev-util/strace
      - net-analyzer/iftop
      - net-analyzer/netcat
      - net-analyzer/nmap
      - net-analyzer/tcpdump
      - net-analyzer/bwm-ng
      - net-firewall/iptables
      - net-misc/bridge-utils
      - net-misc/stunnel
      - sys-apps/lshw
      - sys-apps/pciutils
      - sys-apps/usbutils
      - sys-apps/usermode-utilities
      - sys-devel/bc
      - sys-fs/dfc
      - sys-fs/lsscsi
      - sys-process/iotop
      - sys-process/lsof
      - sys-apps/ack
      - sys-apps/dmidecode
      - app-arch/p7zip
      - app-arch/rar
      - app-arch/rpm
      - app-benchmarks/bonnie++
      - app-cdr/cdrtools
      - app-admin/sudo

fstools:
  pkg.installed:
    - names:
      - sys-fs/dosfstools
      - sys-fs/mtpfs
      - sys-fs/ntfs3g
      - sys-fs/xfsprogs
      - sys-fs/sysfsutils
