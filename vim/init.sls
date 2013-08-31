vim:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}
    - use:
      - python
      - vim-pager
    - require_in:
      - pkg: vim
{% endif %}

/etc/vim/vimrc.local:
  file.managed:
    - source: salt://vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: vim
