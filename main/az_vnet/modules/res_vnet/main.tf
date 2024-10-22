# Resource Group
resource "azurerm_resource_group" "rg" {
  location = "ukwest"
  name     = "res_vnet-rg"
}

# Virtual Network
resource "azurerm_virtual_network" "res_vnet_network" {
  name                = "res_vent_network"
  address_space       = ["10.40.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet 1
resource "azurerm_subnet" "res_vnet_subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.res_vnet_network.name
  address_prefixes     = ["10.40.0.0/24"]
}


output "res_vent_id" {
  value = azurerm_virtual_network.res_vnet_network.id
}