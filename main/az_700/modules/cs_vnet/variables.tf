variable "cs_vnet_rg_name" {
    type = string
  default = "az_700_cs_vnet_rg"
}

variable "cs_vnet_rg_location" {
  type = string
  default = "eastus"
}

variable "private_dns_zone_name" {
  type = any
  default = []
}

variable "private_dns_zone_rg_name" {
  type = any
  default = []
}