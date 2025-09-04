data "azurerm_firewall_policy" "afw_policy" {
  name                = var.fw_policy_name
  resource_group_name = var.resource_group_name
}

module "afw_policy_rule" {
  source = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//firewall_rules"

  firewall_policy_id  = data.azurerm_firewall_policy.afw_policy.id
  firewall_rule_group = var.firewall_rule_group

}