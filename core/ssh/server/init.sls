include:
  - ssh

sshd:
  service:
    - running
    - name: {{ salt['pillar.get']('services:sshd', 'sshd') }}
  require:
    - pkg: openssh
