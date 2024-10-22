resource "azurerm_resource_group" "vnet_peering_rg" {
  name     = "vnet-peering-rg"
  location = "eastus"
}



resource "azurerm_virtual_network_peering" "mfg_vnet_to_cs_vnet" {
  name                      = "mfg_vnet_to_cs_vnet"
  # resource_group_name       = azurerm_resource_group.vnet_peering_rg.name
  resource_group_name       = var.mfg_vnet_rg
  virtual_network_name      = var.mfg_vnet_name
  remote_virtual_network_id = var.cs_vnet_id
}

resource "azurerm_virtual_network_peering" "cs_vnet_to_mfg_vnet" {
  name                      = "cs_vnet_to_mfg_vnet"
  # resource_group_name       = azurerm_resource_group.vnet_peering_rg.name
  resource_group_name       = var.cs_vnet_rg
  virtual_network_name      = var.cs_vnet_name
  remote_virtual_network_id = var.mfg_vnet_id
}