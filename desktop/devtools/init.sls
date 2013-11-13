vcs:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:mercurial', 'mercurial') }}
      - {{ salt['pillar.get']('pkgs:git', 'git') }}
