HOST := $(shell hostname)

ifeq ($(HOST),dev01-x28)
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

ifneq ($(DRYRUN),)
play: CHECK := --check
endif
play: BOOK := site.yml
play:
	$(ANSIBLE_PLAYBOOK) $(BOOK) $(CHECK)

play-role:
	$(ANSIBLE) $(GROUP) -m include_role -a name=$(ROLE)

.PHONY: all play
