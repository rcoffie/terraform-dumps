# Resource Group
resource "azurerm_resource_group" "rg" {
  location = "westus"
  name     = "mfg_vnet-rg"
}

# Virtual Network
resource "azurerm_virtual_network" "mfg_vnet_network" {
  name                = "mfg_vent_network"
  address_space       = ["10.30.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet 1
resource "azurerm_subnet" "mfg_vnet_subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_network.name
  address_prefixes     = ["10.30.10.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "mfg_vent_subnet_2" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_network.name
  address_prefixes     = ["10.30.20.0/24"]
}

output "mfg_vnet_id" {
  value = azurerm_virtual_network.mfg_vnet_network.id
}

output "mfg_winvm_subnet" {
  value = azurerm_subnet.mfg_vnet_subnet_1.id
}

output "mfg_vnet_name" {
  value = azurerm_virtual_network.mfg_vnet_network.name
}

output "mfg_vnet_rg" {
  value = azurerm_resource_group.rg.name
}