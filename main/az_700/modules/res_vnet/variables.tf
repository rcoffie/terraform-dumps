variable "res_vnet_rg_name" {
  type = string 
  default = "az_700_res_vnet"
}

variable "res_vnet_rg_location" {
  type = string 
  default = "eastasia"
}

variable "private_dns_zone_name" {
  type = any
  default = []
}