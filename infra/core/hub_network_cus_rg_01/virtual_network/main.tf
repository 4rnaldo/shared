module "vnet" {
  source  = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//virtual_network"
 
  location             = var.location
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  vnet_address_space   = var.vnet_address_space
  dns_servers          = var.dns_servers
  tags                 = var.tags
}