# Resource Group
resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = "cs_vnet-rg"
}

# Virtual Network
resource "azurerm_virtual_network" "cs_vnet_network" {
  name                = "cs_vent_network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet 1
resource "azurerm_subnet" "cs_vnet_subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_network.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "cs_vent_subnet_2" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "cs_vent_id" {
  value = azurerm_virtual_network.cs_vnet_network.id
}

output "cs_vnet_name" {
  value = azurerm_virtual_network.cs_vnet_network.name
}

output "cs_vnet_rg" {
  value = azurerm_resource_group.rg.name
}