module "winvm" {
  source                  = "./modules/winvm"
  us-rg                   = module.us.us-rg
  us-rg-location          = module.us.us-rg-location
  us-subnet-id            = module.us.us-subnet-id
  us-public_ip_address_id = module.us.us-public-ip-id
}