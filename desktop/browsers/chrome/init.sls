include:
  - desktop.flash

{% if grains['os'] == 'Gentoo' %}
chrome-flags:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'google-chrome-stable') }}
    - accept_keywords:
      - ~ARCH
    - require_in:
      - pkg: chrome
{% endif %}

chrome:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'google-chrome-stable') }}

{% if 'felarof' in grains['id'] %}

{% if grains['os'] == 'Gentoo' %}
libxml-flags:
  portage_config.flags:
    - name: dev-libs/libxml2
    - use:
      - icu
    - require_in:
      - pkg: chromium

harfbuzz-flags:
  portage_config.flags:
    - name: media-libs/harfbuzz
    - use:
      - icu
    - require_in:
      - pkg: chromium

zlib-flags:
  portage_config.flags:
    - name: sys-libs/zlib
    - use:
      - minizip
    - require_in:
      - pkg: chromium
{% endif %}

chromium:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:chromium', 'chromium-browser') }}
    - require:
      - pkg: flash
{% endif %}

{% if grains['os'] == 'Ubuntu' %}
chrome_ppa:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: chrome
{% elif grains['os']  == 'Gentoo' %}
chrome_pkgfiles:
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:chrome', 'google-chrome-stable') }}
    - accpet_keywords:
      - ~ARCH
    - license:
      - google-chrome
    - require_in:
      - pkg: chrome
{% endif %}
