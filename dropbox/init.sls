dropbox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:dropbox', 'dropbox') }}
