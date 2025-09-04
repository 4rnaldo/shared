data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_firewall_policy" "fwpolicy" {
  name                = var.fw_policy_name
  resource_group_name = var.resource_group_name
}


module "firewall" {
  source = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//firewall"

  firewall_name       = var.firewall_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = var.sku_tier
  policy_id           = data.azurerm_firewall_policy.fwpolicy.id
  sku                 = var.sku
  subnet_id           = data.azurerm_subnet.snet.id
  tags                = var.tags

  fw_ip_configs = [
    {
      name                 = "fw-ipconfig"
      public_ip_address_id = azurerm_public_ip.fw_pip.id
      subnet_id            = data.azurerm_subnet.snet.id
    }
  ]
}
