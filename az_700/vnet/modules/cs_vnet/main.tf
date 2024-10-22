resource "azurerm_resource_group" "az_700" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# CoreServices Vnet
resource "azurerm_virtual_network" "cs_vnet_R" {
  name                = "cs-vnet"
  location            = azurerm_resource_group.az_700.location
  resource_group_name = azurerm_resource_group.az_700.name
  address_space       = ["10.20.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

 
}

# GateWay
resource "azurerm_subnet" "gateway_subnet_R" {
  name                 = "gateway-subnet"
  resource_group_name  = azurerm_resource_group.az_700.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.0.0/27"]
}

# Shared Service Subnet
resource "azurerm_subnet" "sharedServices_subnet_R" {
  name                 = "sharedServices_subnet"
  resource_group_name  = azurerm_resource_group.az_700.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.10.0/24"]
}


# database 
resource "azurerm_subnet" "database_subnet_R" {
  name                 = "database_subnet"
  resource_group_name  = azurerm_resource_group.az_700.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.20.0/24"]
}

# Public Web Service Subnet 
resource "azurerm_subnet" "public_web_service_subnet_R" {
  name                 = "public-web-service-subnet"
  resource_group_name  = azurerm_resource_group.az_700.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.30.0/24"]
}


# Private DNS ZONE 

resource "azurerm_private_dns_zone_virtual_network_link" "cs_vnet-link" {
  name                  = "Research-network-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.cs_vnet_private_dns
  virtual_network_id    = azurerm_virtual_network.cs_vnet_R.id
}


output "database_subnet" {
  value = azurerm_subnet.sharedServices_subnet_R.id
}