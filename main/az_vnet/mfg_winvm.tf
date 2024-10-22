module "mfg_winvm" {
  source           = "./modules/mfg_winvm"
  mfg_winvm_subnet = module.mfg_vnet.mfg_winvm_subnet
}