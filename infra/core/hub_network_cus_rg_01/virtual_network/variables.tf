variable "virtual_network_name" {
  description = "Name of the virtual network to deploy"
}

variable "vnet_address_space" {
  description = "Address space of the Virtual Network"
}

variable "resource_group_name" {
  description = "Resource Group to deploy Virtual Network in"
}

variable "location" {
  description = "Azure region resource will be deployed in"
}

variable "dns_servers" {
  description = "DNS servers assigned to virtual network. (Defaults to Azure DNS Servers)"
  default     = null
}

variable "tags" {
  description = "Tags to add to resource"
}