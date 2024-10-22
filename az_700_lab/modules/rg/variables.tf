variable "cs_vnet_rg" {
  type = string 
  description = "Corservices"
  default = "cs_vnet_rg"
}

variable "cs_vnet_rg_location" {
  type = string 
  description = "coreservices resource group location"
  default = "eastus"
}


variable "mfg_vnet_rg" {
  type = string 
  description = "Manufacturing Resources group"
  default = "mfg_vnet_rg"
}

variable "mfg_vnet_rg_location" {
  type = string 
  description = "Manufacturing resource group location"
  default = "westus"
}


variable "res_vnet_rg" {
  type = string 
  description = "Resources Resource group"
  default = "res_vnet_rg"
}

variable "res_vnet_rg_location" {
  type = string 
  description = "Resources resource group location"
  default = "eastasia"
}

