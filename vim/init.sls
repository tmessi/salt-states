vim:
  pkg:
    - installed
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}
