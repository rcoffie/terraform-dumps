module "pdns" {
  source      = "./modules/pdns"
  cs_vnet_id  = module.cs_vnet.cs_vent_id
  mfg_vnet_id = module.mfg_vnet.mfg_vnet_id
  res_vnet_id = module.res_vnet.res_vent_id
}