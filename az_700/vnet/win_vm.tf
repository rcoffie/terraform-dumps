module "win_vm" {
  source    = "./modules/win_vm"
  vm_subnet = module.cs_vnet.database_subnet


}
