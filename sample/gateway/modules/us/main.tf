resource "azurerm_resource_group" "us" {
  name     = "us"
  location = "eastus"
}

resource "azurerm_virtual_network" "us" {
  name                = "us"
  location            = azurerm_resource_group.us.location
  resource_group_name = azurerm_resource_group.us.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "us_gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.us.name
  virtual_network_name = azurerm_virtual_network.us.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "us" {
  name                = "us"
  location            = azurerm_resource_group.us.location
  resource_group_name = azurerm_resource_group.us.name
  allocation_method   = "Dynamic"
}

output "us-rg" {
  value = azurerm_resource_group.us.name
}

output "us-rg-location" {
  value = azurerm_resource_group.us.location
}

output "us-public-ip-id" {
  value = azurerm_public_ip.us.id
}

output "us-subnet-id" {
  value = azurerm_subnet.us_gateway.id
}

output "us-vnet-id" {
  value = azurerm_virtual_network.us.id
}