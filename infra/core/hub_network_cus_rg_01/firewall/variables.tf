variable "resource_group_name" {
  description = "(Required) Name of Resource Group to deploy resources"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resource in"
  type        = string
}

variable "firewall_name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
  type        = string
}

variable "tags" {

}

variable "sku" {

}

variable "sku_tier" {

}

variable "virtual_network_name" {

}

variable "subnet_name" {

}

variable "fw_policy_name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
  type        = string
}