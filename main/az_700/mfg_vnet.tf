module "mfg_vnet" {
  source = "./modules/mfg_vnet"
  # private_dns_zone_name = module.az_private_dns.private_dns
}