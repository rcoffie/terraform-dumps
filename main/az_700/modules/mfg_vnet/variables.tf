variable "mfg_vnet_rg_name" {
  type = string 
  default = "az_700_mfg_vnet_rg"
}

variable "mfg_vnet_rg_location" {
  type = string 
  default = "westus"
}

variable "private_dns_zone_name" {
  type = any 
  default = []
}