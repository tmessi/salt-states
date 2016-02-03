include:
  - desktop.flash

chrome:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'google-chrome-stable') }}


{% if grains['os'] == 'Ubuntu' %}
chrome_ppa:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: chrome
{% elif grains['os']  == 'Gentoo' %}
chrome_flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'google-chrome-stable') }}
    - accept_keywords:
      - ~ARCH
    - license:
      - google-chrome
    - require_in:
      - pkg: chrome
{% endif %}
