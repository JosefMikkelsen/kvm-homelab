SHELL := /bin/bash
.PHONY: shutdown undefine destroy up remove-vols destroy

up:
	ansible-playbook -K kvm_provision.yaml

shutdown:
	sudo virsh list --all --name | sudo xargs -r -n 1 virsh shutdown --domain || true

undefine: shutdown
	sudo virsh list --all --name | sudo xargs -r -n 1 virsh undefine --domain

make remove-vols: undefine
	for i in `yq -r .[2].block.[].loop.[].hostname roles/kvm_provision/tasks/main.yml`; do sudo rm /var/lib/libvirt/images/$$i.qcow2; done

make destroy: remove-vols
