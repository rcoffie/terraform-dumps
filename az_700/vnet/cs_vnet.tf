module "cs_vnet" {
  source              = "./modules/cs_vnet"
  cs_vnet_private_dns = module.azurerm_private_dns_zone.private_dns_zone

}
