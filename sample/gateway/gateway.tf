module "gateway" {
  source = "./modules/gateway"
  # us
  us-rg           = module.us.us-rg
  us-rg-location  = module.us.us-rg-location
  us-public-ip-id = module.us.us-public-ip-id
  us-subnet-id    = module.us.us-subnet-id

  # euruope 
  europe-rg           = module.europe.europe-rg
  europe-rg-location  = module.europe.europe-rg-location
  europe-public-ip-id = module.europe.europe-public-ip-id
  europe-subnet-id    = module.europe.europe-subnet-id
}