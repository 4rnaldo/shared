terraform {
  required_version = ">=1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3"
    }
  }
  backend "azurerm" {
    resource_group_name  = "management-tfstate-eus-rg-01"
    storage_account_name = "mgmttfstateeusstg01"
    container_name       = "sub-gatik-connectivity-01"
    key                  = "hub_network_eus_rg_01_firewall_rules.tfstate"
    subscription_id      = "694fed91-f91d-447d-9fe5-52bd0a33f392"
  }
}

provider "azurerm" {
  features {
  }
}
