module "cs_vnet" {
  source = "./modules/cs_vnet"
  #   cs_vnet_private_dns = module.azurerm_private_dns_zone.private_dns_zone
  cs_vnet_rg          = module.rg.cs_vnet_rg_name
  cs_vnet_rg_location = module.rg.cs_vnet_rg_location

}
