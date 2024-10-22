# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "example-network"
  resource_group_name = var.rg.name
  location            = var.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

 
}


output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet" {
  value = azurerm_subnet.example
}