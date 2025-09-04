variable "resource_group_name" {
  description = "The name of the Resource Group to be created."
  type        = string
}

variable "location" {
  description = "The region to create the Resource Group in."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}

variable "enable_resource_group_delete_lock" {
  description = "Enable Delete Lock on resource group"
  type        = bool
  default     = false
}
