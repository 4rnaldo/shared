module "afw_policy" {
  source = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//firewall_policy"

  fw_policy_name      = var.fw_policy_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}