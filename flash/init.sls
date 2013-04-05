flash:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:flash', 'flash') }}
