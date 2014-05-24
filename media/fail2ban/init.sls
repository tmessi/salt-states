fail2ban:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: fail2ban
    - watch:
      - file: /etc/fail2ban/jail.local
      - file: /etc/fail2ban/filter.d/nginx-auth.conf
      - file: /etc/fail2ban/filter.d/nginx-login.conf
      - file: /etc/fail2ban/filter.d/nginx-noscript.conf
      - file: /etc/fail2ban/filter.d/nginx-proxy.conf
      - file: /etc/fail2ban/jail.d/nginx.conf

/etc/fail2ban/jail.local:
  file.managed:
    - source: salt://media/fail2ban/jail.local
    - user: root
    - group: root
    - mode: 644

/etc/fail2ban/filter.d/nginx-auth.conf:
  file.managed:
    - source: salt://media/fail2ban/nginx-auth.conf
    - user: root
    - group: root
    - mode: 644

/etc/fail2ban/filter.d/nginx-login.conf:
  file.managed:
    - source: salt://media/fail2ban/nginx-login.conf
    - user: root
    - group: root
    - mode: 644

/etc/fail2ban/filter.d/nginx-noscript.conf:
  file.managed:
    - source: salt://media/fail2ban/nginx-noscript.conf
    - user: root
    - group: root
    - mode: 644

/etc/fail2ban/filter.d/nginx-proxy.conf:
  file.managed:
    - source: salt://media/fail2ban/nginx-proxy.conf
    - user: root
    - group: root
    - mode: 644

/etc/fail2ban/jail.d/nginx.conf:
  file.managed:
    - source: salt://media/fail2ban/nginx.conf
    - user: root
    - group: root
    - mode: 644
