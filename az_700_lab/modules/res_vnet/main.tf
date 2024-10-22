resource "azurerm_resource_group" "res_vnet_RG" {
  name     = var.res_vnet_rg_name
  location = var.res_vnet_rg_location
}

# CoreServices Vnet
resource "azurerm_virtual_network" "res_vnet_R" {
  name                = "res-vnet"
  location            = azurerm_resource_group.res_vnet_RG.location
  resource_group_name = azurerm_resource_group.res_vnet_RG.name
  address_space       = ["10.40.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


}

# Manufacturing System Subnet
resource "azurerm_subnet" "res_subnet_R" {
  name                 = "res-subnet"
  resource_group_name  = azurerm_resource_group.res_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.res_vnet_R.name
  address_prefixes     = ["10.40.0.0/24"]
}


# private dns link
# resource "azurerm_private_dns_zone_virtual_network_link" "mfg_net_link" {
#   name                  = "Research-network-link"
#   resource_group_name   = var.resource_group_name
#   private_dns_zone_name = var.res_vnet_private_dns
#   virtual_network_id    = azurerm_virtual_network.res_vnet_R.id
# }
