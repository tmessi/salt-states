laptop-mode-tools:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:laptop-mode', 'laptop-mode') }}

acpitool:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:acpitool', 'acpitool') }}
