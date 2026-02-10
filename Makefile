SHELL := /bin/bash
.PHONY: up destroy

up:
	ansible-playbook -K kvm_provision.yaml

make destroy:
	ansible-playbook -K kvm_destroy.yaml
