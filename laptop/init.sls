laptop-mode-tools:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:laptop-mode', 'laptop-mode') }}
