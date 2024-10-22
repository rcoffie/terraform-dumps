module "res_vnet" {
  source = "./modules/res_vnet"
  #   res_vnet_private_dns = module.azurerm_private_dns_zone.private_dns_zone
  res_vnet_rg_name     = module.rg.res_vnet_rg_name
  res_vnet_rg_location = module.rg.res_vnet_rg_location

}
