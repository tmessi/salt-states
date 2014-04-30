noip-updater:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:noip-updater', 'noip2') }}
  service.running:
    - name: {{ salt['pillar.get']('services:noip-updater', 'noip') }}
    - enable: True
