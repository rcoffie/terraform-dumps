module "mfg_vnet" {
  source              = "./modules/mfg_vnet"
  mfg_net_private_dns = module.azurerm_private_dns_zone.private_dns_zone

}
