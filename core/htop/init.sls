htop:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:htop', 'htop') }}
