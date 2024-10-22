module "vent" {
  source                  = "./modules/vnet"
  resource_group_name     = module.pdns.resource_group_name
  resource_group_location = module.pdns.resource_group_location
}