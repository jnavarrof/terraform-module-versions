# main.tf 
module "module1" {
  source = "../../modules/no-resource"
  name = "data-development-project0"
}

module "module2" {
  source = "../../modules/no-resource-new"
  name = "data-development-project0"
}
