# Using Terraform provider modules versions

An example how to use different provider versions accross modules and root module.


## Generate terraform projects

A make rule will generate two terraform example projects (`projec0` and `project1`) using two different terraform modules.

```shell
$ make generate
scripts/generate.sh

$tree -L 2 -d development                                                        
development
├── project0
└── project1

3 directories
```

## Example: Compatible project

This example shows an example of one project using compatible module versions, accross all modules and root version.

```shell
$ cd development/project0
$ terraform init 
Initializing modules...
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/null versions matching ">= 2.0.0, ~> 3.0, < 3.2.0"...
- Installing hashicorp/null v3.1.1...
- Installed hashicorp/null v3.1.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Example: Project with modules using incompatible provider 

This example shows an example of one project using **incompatible module versions** that cannot be solved by terraform during the `terrarform init` step.

```shell
$ cd development/project1
$ terraform init     
Initializing modules...
- module1 in ../../modules/no-resource
- module2 in ../../modules/no-resource-new

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/null versions matching ">= 2.0.0, ~> 3.0, < 3.0.0, < 3.2.0"...
╷
│ Error: Failed to query available provider packages
│ 
│ Could not retrieve the list of available versions for provider hashicorp/null: no available releases match the given constraints >= 2.0.0, ~> 3.0, < 3.0.0, < 3.2.0
```
