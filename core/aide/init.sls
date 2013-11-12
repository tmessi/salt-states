aide:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:aide', 'aide') }}
