.PHONY: tf-init tf-plan tf-apply tf-lint ansible-exists ansible-test

# Terraform Commands
tf-init: ## Initialize the terraform state/Update the providers
	terraform -chdir=terraform init  

tf-lint: ## Check the Terraform config
	terraform -chdir=terraform validate && terraform -chdir=terraform fmt -recursive

tf-plan: tf-lint ## Check what changes are gonna happen
	terraform -chdir=terraform plan 

tf-apply: tf-lint ## Apply the changes
	terraform -chdir=terraform apply  --auto-approve


# Ansible commands

ansible-exists: ## Confirm Ansible Exists
	$(call assert_command_exists,ansible)

ansible-test: ansible-exists ## A test task
	ansible all -m ping


## Utilities

# Make sure the command exists
define assert_command_exists
	@command -v "$(1)" >/dev/null 2>&1 || { echo >&2 "\033[31;1m Install $(1) and try again.\033[0m"; exit 1;}
endef

# This code below will pretty print out the help data
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/:/'`); \
	printf "%-20s %s\n" "target" "help" ; \
	printf "%-20s %s\n" "------" "----" ; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$':' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf '\033[36m'; \
		printf "%-20s %s" $$help_command ; \
		printf '\033[0m'; \
		printf "%s\n" $$help_info; \
	done