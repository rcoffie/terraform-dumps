resource "azurerm_resource_group" "az_700" {
  name = var.cs_vnet_rg_name
  location = var.cs_vnet_rg_location
}

output "cs_vnet_rg_name" {
  value = azurerm_resource_group.az_700.name
}

output "cs_vent_rg_location" {
  value = azurerm_resource_group.az_700.location
}