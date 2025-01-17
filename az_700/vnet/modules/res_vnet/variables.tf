variable "resource_group_location" {
  type        = string
  default     = "eastasia"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  type    = string
  default = "az_700"
}


variable "res_vnet_private_dns" {
  type = any
  default = []
}