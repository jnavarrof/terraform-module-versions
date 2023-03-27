.PHONY: generate
generate:
	scripts/generate.sh

.PHONY: plan
plan:
	terragrunt run-all plan

.PHONY: apply
apply:
	terragrunt run-all apply

.PHONY: clean
clean:
	rm -rf development production staging terragrunt.hcl
