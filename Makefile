HOST := $(shell hostname)
ifeq ($(HOST),dev03-bco)
  GROUP := production
else ifeq ($(HOST),debian-vagrant)
  GROUP := development
else ifeq ($(HOST),debian-laptop)
  GROUP := laptop
endif

ANSIBLE := ansible -i hosts.$(GROUP) -e 'ansible_python_interpreter=/usr/bin/python3'
ANSIBLE_PLAYBOOK := ansible-playbook -i hosts.$(GROUP) -K -e 'ansible_python_interpreter=/usr/bin/python3' -l $(GROUP)

all:
	$(ANSIBLE) $(GROUP) -m ping

play: BOOK := site.yml
play:
	$(ANSIBLE_PLAYBOOK) $(BOOK)

.PHONY: all play
