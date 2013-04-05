vim:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}

/etc/vim/vimrc.local:
  file.managed:
    - source: salt://vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: vim
