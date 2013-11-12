include:
  - desktop.flash

chrome:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'chromium') }}
    - require:
      - pkg: flash
