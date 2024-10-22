module "vent_peering" {
  source        = "./modules/vnet_peering"
  mfg_vnet_name = module.mfg_vnet.mfg_vnet_name
  mfg_vnet_rg   = module.mfg_vnet.mfg_vnet_rg
  mfg_vnet_id   = module.mfg_vnet.mfg_vnet_id
  cs_vnet_rg    = module.cs_vnet.cs_vnet_rg
  cs_vnet_name  = module.cs_vnet.cs_vnet_name
  cs_vnet_id    = module.cs_vnet.cs_vent_id
}