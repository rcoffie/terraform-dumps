resource "azurerm_resource_group" "cs_vnet_RG" {
  name     = var.cs_vnet_rg_name
  location = var.cs_vnet_rg_location
}

resource "azurerm_virtual_network" "cs_vnet_R" {
  name                = "cs-vnet"
  location            = azurerm_resource_group.cs_vnet_RG.location
  resource_group_name = azurerm_resource_group.cs_vnet_RG.name
  address_space       = ["10.20.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


}

# GateWay
resource "azurerm_subnet" "gateway_subnet_R" {
  name                 = "gateway-subnet"
  resource_group_name  = azurerm_resource_group.cs_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.0.0/27"]
}

# Shared Service Subnet
resource "azurerm_subnet" "sharedServices_subnet_R" {
  name                 = "sharedServices_subnet"
  resource_group_name  = azurerm_resource_group.cs_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.10.0/24"]
}


# database 
resource "azurerm_subnet" "database_subnet_R" {
  name                 = "database_subnet"
  resource_group_name  = azurerm_resource_group.cs_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.20.0/24"]
}

# Public Web Service Subnet 
resource "azurerm_subnet" "public_web_service_subnet_R" {
  name                 = "public-web-service-subnet"
  resource_group_name  = azurerm_resource_group.cs_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.cs_vnet_R.name
  address_prefixes     = ["10.20.30.0/24"]
}

# # private dns link
# resource "azurerm_private_dns_zone_virtual_network_link" "cs_vnet_link" {
#   name                  = "Research-network-link"
#   resource_group_name   = var.private_dns_zone_rg_name
#   private_dns_zone_name = var.private_dns_zone_name
#   virtual_network_id    = azurerm_virtual_network.cs_vnet_R.id
# }

output "res_vnet_rg" {
  value = azurerm_resource_group.cs_vnet_RG.name
}

output "res_vnet_id" {
  value = azurerm_virtual_network.cs_vnet_R.id
}