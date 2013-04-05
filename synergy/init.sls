synergy:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:synergy ', 'synergy') }}
