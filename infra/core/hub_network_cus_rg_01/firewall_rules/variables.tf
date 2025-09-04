variable "resource_group_name" {
  description = "(Required) Name of Resource Group to deploy resources"
  type        = string
}

variable "fw_policy_name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
  type        = string
}


variable "firewall_rule_group" {
  type = map(object({
    priority = number
    application_rule_collection = optional(map(object({
      action   = string
      priority = number
      rules = map(object({
        http_headers = optional(map(object({
          value = list(string)
        })))
        protocols = optional(map(object({
          port = number
        })))
        source_addresses      = optional(list(string))
        destination_fqdns     = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_addresses = optional(list(string))
        destination_fqdn_tags = optional(list(string))
      }))
    })))
    network_rule_collection = optional(map(object({
      action   = string
      priority = number
      rules = map(object({
        description           = optional(string)
        protocols             = list(string)
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_addresses = optional(list(string))
        destination_ip_groups = optional(list(string))
        destination_ports     = optional(list(string))
        destination_fqdns     = optional(list(string))

      }))
    })))
    nat_rule_collection = optional(map(object({
      action   = string
      priority = number
      rules = map(object({
        description         = optional(string)
        protocols           = list(string)
        source_addresses    = optional(list(string))
        source_ip_groups    = optional(list(string))
        destination_ports   = optional(list(string))
        destination_address = optional(string)
        translated_port     = optional(string)
        translated_address  = optional(string)
        translated_fqdn     = optional(string)
    })) })))
  }))
}
