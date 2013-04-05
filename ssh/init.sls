openssh:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:openssh', 'openssh') }}
