
geoip:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:geoip', 'libgeoip-dev') }}

mcrypt:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:libmcrypt', 'libmcrypt-dev') }}

java:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:jdk', 'openjdk-6-jdk') }}
