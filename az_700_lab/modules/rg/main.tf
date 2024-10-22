resource "azurerm_resource_group" "cs_vnet_RG" {
  name     = var.cs_vnet_rg
  location = var.cs_vnet_rg_location
}

resource "azurerm_resource_group" "mfg_vnet_RG" {
  name     = var.mfg_vnet_rg
  location = var.mfg_vnet_rg_location
}

resource "azurerm_resource_group" "res_vnet_RG" {
  name     = var.res_vnet_rg
  location = var.res_vnet_rg_location
}

# output 

# coreservices
output "cs_vnet_rg_name" {
  value = azurerm_resource_group.cs_vnet_RG.name
}

output "cs_vnet_rg_location" {
  value = azurerm_resource_group.cs_vnet_RG.location
}

# Manufacturing
output "mfg_vnet_rg_name" {
  value = azurerm_resource_group.mfg_vnet_RG.name
}

output "mfg_vnet_rg_location" {
  value = azurerm_resource_group.mfg_vnet_RG.location
}

# Resource
output "res_vnet_rg_name" {
  value = azurerm_resource_group.res_vnet_RG.name
}

output "res_vnet_rg_location" {
  value = azurerm_resource_group.res_vnet_RG.location
}