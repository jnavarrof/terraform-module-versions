# main.tf 
module "module1" {
  source = "../../modules/no-resource"
  name = "data-development-project1"
}

module "module2" {
  source = "../../modules/no-resource-new"
  name = "data-development-project1"
}
