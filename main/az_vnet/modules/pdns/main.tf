resource "azurerm_resource_group" "rg" {
  name     = "pdns-rg"
  location = "eastus"
}


# Resource-1: Create Azure Private DNS Zone
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "700.com"
  resource_group_name = azurerm_resource_group.rg.name
}

# Resource-2: Associate Private DNS Zone to Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_vnet_associate" {
  name                  = "cs_vnet"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.cs_vnet_id
}

# Resource-2: Associate Private DNS Zone to Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "mfg_private_dns_zone_vnet" {
  name                  = "mfg_vnet"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.mfg_vnet_id
}

# Resource-2: Associate Private DNS Zone to Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "res_private_dns_zone_vnet" {
  name                  = "res_vnet"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.res_vnet_id
}