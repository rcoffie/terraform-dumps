module "pdns" {
  source  = "./modules/pdns"
  vnet_id = module.vent.vnet_id
}