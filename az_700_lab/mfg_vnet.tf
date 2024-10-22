module "mfg_vnet" {
  source = "./modules/mfg_vnet"
  #   mfg_net_private_dns = module.azurerm_private_dns_zone.private_dns_zone
  mfg_vnet_name     = module.rg.mfg_vnet_rg_name
  mfg_vnet_location = module.rg.mfg_vnet_rg_location

}
