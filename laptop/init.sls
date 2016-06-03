{% if grains['os'] == 'Gentoo' %}
linux-firmware:
  pkg.installed:
    - name: sys-kernel/linux-firmware
{% endif %}

laptop-mode-tools:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:laptop-mode', 'laptop-mode') }}

acpitool:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:acpitool', 'acpitool') }}
