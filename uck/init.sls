uck:
  pkg.installed:
    - name: uck

ubuntu-livecd:
  file.managed:
    - name: /home/vagrant/ubuntu-12.04.2-desktop-amd64.iso
    - source: http://releases.ubuntu.com/precise/ubuntu-12.04.2-desktop-amd64.iso
    - source_hash: md5=b436b6d4c7de064652f30d783bda5b4e
