resource "azurerm_resource_group" "mfg_vnet_RG" {
  name     = var.mfg_vnet_rg_name
  location = var.mfg_vnet_rg_location
}

# CoreServices Vnet
resource "azurerm_virtual_network" "mfg_vnet_R" {
  name                = "mfg-vnet"
  location            = azurerm_resource_group.mfg_vnet_RG.location
  resource_group_name = azurerm_resource_group.mfg_vnet_RG.name
  address_space       = ["10.30.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

 
}

# Manufacturing System Subnet
resource "azurerm_subnet" "manufacturing_system_subnet_R" {
  name                 = "manufacturing-system-subnet"
  resource_group_name  = azurerm_resource_group.mfg_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_R.name
  address_prefixes     = ["10.30.10.0/24"]
}

# Sensor Subnet1
resource "azurerm_subnet" "sensor_subnet1_R" {
  name                 = "sensor-subnet1"
  resource_group_name  = azurerm_resource_group.mfg_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_R.name
  address_prefixes     = ["10.30.20.0/24"]
}


# Sensor Subnet2
resource "azurerm_subnet" "sensor_subnet2_R" {
  name                 = "sensor-subnet2"
  resource_group_name  = azurerm_resource_group.mfg_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_R.name
  address_prefixes     = ["10.30.21.0/24"]
}

# Sensor Subnet3
resource "azurerm_subnet" "sensor_subnet3_R" {
  name                 = "sensor-subnet3"
  resource_group_name  = azurerm_resource_group.mfg_vnet_RG.name
  virtual_network_name = azurerm_virtual_network.mfg_vnet_R.name
  address_prefixes     = ["10.30.22.0/24"]
}

# private dns link
# private dns link
# resource "azurerm_private_dns_zone_virtual_network_link" "mfg_vnet_link" {
#   name                  = "manufacturing-network-link"
#   resource_group_name   = var.mfg_vnet_rg_name
#   private_dns_zone_name = var.private_dns_zone_name
#   virtual_network_id    = azurerm_virtual_network.mfg_vnet_R.id
# }
