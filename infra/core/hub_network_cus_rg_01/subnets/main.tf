module "subnet" {
  source = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//subnets"

  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnets              = var.subnets
}
