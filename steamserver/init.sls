
server_deps:
  pkg.installed:
    - pkgs: 
        - lib32gcc1
        - ia32-libs

/srv/steam/steamcmd_linux.tar.gz:
  file.managed:
    - source: http://media.steampowered.com/client/steamcmd_linux.tar.gz
    - source_hash: md5=09e3f75c1ab5a501945c8c8b10c7f50e
