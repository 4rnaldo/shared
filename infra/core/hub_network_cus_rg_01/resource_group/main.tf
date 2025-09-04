module "rg" {
  source  = "git::ssh://git@gitlab.com/gatik-product-repos/gatik-alz/gatik-tf-modules.git//resource_group"

  resource_group_name               = var.resource_group_name
  enable_resource_group_delete_lock = var.enable_resource_group_delete_lock
  location                          = var.location
  tags                              = var.tags

}


#---------------------------------------------------------
# Activity Logs - Send to LAW for entire subscription for Security / Sentinel
#---------------------------------------------------------
data "azurerm_subscription" "current" {}

data "azurerm_log_analytics_workspace" "laws"{
    provider = azurerm.management
    name                       = "shared-security-eus-log-01"
    resource_group_name        = "management-monitoring-eus-rg-01"
}

resource "azurerm_monitor_diagnostic_setting" "subscription_activity_logs_diagnostic_settings" {
    name                            = join("_", [data.azurerm_subscription.current.display_name, "subscription_security_logs"])
    target_resource_id              = data.azurerm_subscription.current.id
    log_analytics_workspace_id      = data.azurerm_log_analytics_workspace.laws.id
    log_analytics_destination_type  = "Dedicated"
    
    dynamic "enabled_log" {
      for_each = toset(["Administrative", "Security", "ServiceHealth", "Alert", "Recommendation", "Policy", "Autoscale", "ResourceHealth"])
  
      content {
        category = enabled_log.value
      }
    }
  
    lifecycle {
      ignore_changes = [enabled_log, log, metric, target_resource_id]
    }
}