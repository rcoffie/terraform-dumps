resource "azurerm_resource_group" "europe" {
  name     = "europe"
  location = "West Europe"
}

resource "azurerm_virtual_network" "europe" {
  name                = "europe"
  location            = azurerm_resource_group.europe.location
  resource_group_name = azurerm_resource_group.europe.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "europe_gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.europe.name
  virtual_network_name = azurerm_virtual_network.europe.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_public_ip" "europe" {
  name                = "europe"
  location            = azurerm_resource_group.europe.location
  resource_group_name = azurerm_resource_group.europe.name
  allocation_method   = "Dynamic"
}


output "europe-rg" {
  value = azurerm_resource_group.europe.name
}

output "europe-rg-location" {
  value = azurerm_resource_group.europe.location
}

output "europe-public-ip-id" {
  value = azurerm_public_ip.europe.id
}

output "europe-subnet-id" {
  value = azurerm_subnet.europe_gateway.id
}

output "europe-vnet-id" {
  value = azurerm_public_ip.europe.id
}
