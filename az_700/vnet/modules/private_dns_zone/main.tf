resource "azurerm_private_dns_zone" "az-700-pdns-R" {
  name                = "az-700.com"
  resource_group_name = var.resource_group_name
  
}


output "private_dns_zone" {
  value = azurerm_private_dns_zone.az-700-pdns-R.id
}
