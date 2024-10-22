# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "vnet-rg"
  location = "West Europe"
}


output "rg" {
  value = azurerm_resource_group.rg
}