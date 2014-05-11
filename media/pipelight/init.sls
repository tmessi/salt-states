pipelight:
  pkgrepo.managed:
    - ppa: pipelight/stable
  pkg:
    - name: pipelight-multi
    - require:
      - pkgrepo: pipelight

enable_silverlight:
  cmd.wait:
    - name: pipelight-plugin --enable silverlight
    - watch:
      - pkg: pipelight
