Salt States
===========

[Salt](http://docs.saltstack.com/en/latest/)
[states](http://docs.saltstack.com/en/latest/ref/states/all/index.html) for my
machines.

Usage notes
-----------

For masterless with ssh-agent::

    sudo SSH_AUTH_SOCK=$SSH_AUTH_SOCK salt-call state.highstate
