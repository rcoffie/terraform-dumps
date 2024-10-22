module "res_vnet" {
  source = "./modules/res_vnet"
  # private_dns_zone_name = module.az_private_dns.private_dns
}