.PHONY: deploy deploy-prod validate report destroy

deploy:
	cd terraform && terraform init && terraform apply -var-file=local.tfvars -auto-approve

deploy-prod:
	cd terraform && terraform init && terraform apply -var-file=prod.tfvars -auto-approve

validate:
	cd terraform && terraform validate && terraform fmt -check

report:
	python compliance/report.py

destroy:
	cd terraform && terraform destroy -var-file=local.tfvars -auto-approve

all: deploy report
