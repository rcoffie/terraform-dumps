module "res_vnet" {
  source               = "./modules/res_vnet"
  res_vnet_private_dns = module.azurerm_private_dns_zone.private_dns_zone

}
