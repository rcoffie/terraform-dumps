resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}


# Resource-1: Create Azure Private DNS Zone
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "terraformguru.com"
  resource_group_name = azurerm_resource_group.example.name
}

# Resource-2: Associate Private DNS Zone to Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_vnet_associate" {
  name                  = "example-private-dns-zone-vnet-associate"
  resource_group_name   = azurerm_resource_group.example.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.vnet_id
}

# Resource-3: Internal Load Balancer
# resource "azurerm_private_dns_a_record" "app_lb_dns_record" {
#   depends_on = [azurerm_lb.app_lb]
#   name                = "applb" 
#   zone_name           = azurerm_private_dns_zone.private_dns_zone.name
#   resource_group_name = azurerm_resource_group.rg.name
#   ttl                 = 300
#   records             = ["${azurerm_lb.app_lb.frontend_ip_configuration[0].private_ip_address}"]
# }

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}