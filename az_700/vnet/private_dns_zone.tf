module "azurerm_private_dns_zone" {
  source = "./modules/private_dns_zone"
  pdns   = "var.pdns"
}
output "name" {
  value = "welcome"
}

output "public_dns1" {
  value = module.azurerm_private_dns_zone
}

