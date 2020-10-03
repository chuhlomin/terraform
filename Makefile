.PHONY: help plan deploy

## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'


## plan: runs `terraform plan`
plan:
	@terraform plan

## apply: runs `terraform deploy`
apply:
	@terraform apply
