variable "name" {
  type = string
}

resource "null_resource" "noop" {
  triggers = {
    noop_id = var.name
  }
}