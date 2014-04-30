noip-updater:
  pkg.install:
    - name: {{ salt['pillar.get']('pkg:noip-updater', 'noip2') }}
  service.running:
    - name: {{ salt['pillar.get']('service:noip-updater', 'noip') }}
    - enable: True
