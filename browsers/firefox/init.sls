include:
  - flash

firefox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:firefox', 'firefox') }}
    - require:
      - pkg: flash
