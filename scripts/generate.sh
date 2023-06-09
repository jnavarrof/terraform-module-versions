#!/bin/bash

# ENVIRONMENTS="development staging production"
ENVIRONMENTS="development"

for e in $ENVIRONMENTS; do
  for i in $(seq 0 1); do
    mkdir -p $e/project$i
cat<<-EOF >$e/project$i/main.tf
# main.tf 
module "module1" {
  source = "../../modules/no-resource"
  name = "data-$e-project$i"
}

module "module2" {
  source = "../../modules/no-resource-new"
  name = "data-$e-project$i"
}
EOF
  done

cat<<-EOF >$e/project$i/versions.tf
# versions.tf 
terraform {
	required_version = ">=1.0.0"

    required_providers {
        null = "~> 3.0"
    }
}
EOF

# Path project 1 with incompatible version
cat<<-EOF >$e/project1/versions.tf
# versions.tf 
terraform {
	required_version = ">=1.0.0"

    required_providers {
      null = ">= 2.0, < 3.0"
    }
}
EOF
done

exit
