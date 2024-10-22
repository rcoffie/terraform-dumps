module "cs_vnet" {
  source = "./modules/cs_vnet"
  # private_dns_zone_name    = module.az_private_dns.private_dns
  # private_dns_zone_rg_name = module.az_private_dns.private_dns_zone_rg_name
  #   cs_vnet_rg_name     = module.rg.cs_vnet_rg_name
  #   cs_vnet_rg_location = module.rg.cs_vent_rg_location
}