module "az_private_dns" {
  source      = "./modules/private_dns"
  res_vnet_rg = module.cs_vnet.res_vnet_rg
  res_vent_id = module.cs_vnet.res_vnet_id
}