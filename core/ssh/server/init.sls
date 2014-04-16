include:
  - core.ssh

sshd:
  service:
    - running
    - name: {{ salt['pillar.get']('services:sshd', 'ssh') }}
  require:
    - pkg: openssh
