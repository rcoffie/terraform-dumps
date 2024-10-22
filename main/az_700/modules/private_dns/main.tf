resource "azurerm_resource_group" "az_700_private_dns" {
  name     = "az_700_private_dns"
  location = "eastus"
}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "terraformguru.com"
  resource_group_name = azurerm_resource_group.az_700_private_dns.name
}


output "private_dns" {
  value = azurerm_private_dns_zone.private_dns_zone
}

output "private_dns_zone_rg_name" {
  value = azurerm_resource_group.az_700_private_dns.name
}

# private dns link
resource "azurerm_private_dns_zone_virtual_network_link" "cs_vnet_link" {
  name                  = "Research-network-link"
  resource_group_name   = azurerm_private_dns_zone.private_dns_zone.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.res_vent_id
}
