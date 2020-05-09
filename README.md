debian-setup
============

Provision all of my Debian nodes.


Nodes (Groups)
--------------

* debian-laptop
* debian-vagrant
* dev03-bco


How To Run
----------

    make all play

With group name:

    make play GROUP=production

Run one roles only:

    sudo make play-role GROUP=production ROLE=nginx


See Also
--------

* Module Docs: https://docs.ansible.com/ansible/latest/modules/modules_by_category.html
* Good Examples: https://github.com/ansible/ansible-examples
