H?=inventory/hosts

setup-ssh:
	ansible-playbook webserver.yml -i "${H}" --tags ssh -k -c paramiko ${A}

deploy:
	@if [[ -z "$P" ]]; then \
		echo -ne "\nUsage:  make $@ P=<flaskr_dir>\n\n"; \
		exit 1; \
	fi
	ansible-playbook site.yml -i "${H}" -e "flaskr_dir=${P}" ${A}
