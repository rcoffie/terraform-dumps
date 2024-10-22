resource "azurerm_virtual_network_gateway" "us" {
  name                = "us-gateway"
  location            = var.us-rg-location
  resource_group_name = var.us-rg

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "Basic"

  ip_configuration {
    public_ip_address_id          = var.us-public-ip-id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.us-subnet-id
  }
}


resource "azurerm_virtual_network_gateway" "europe" {
  name                = "europe-gateway"
  location            = var.europe-rg-location
  resource_group_name = var.europe-rg

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "Basic"

  ip_configuration {
    public_ip_address_id          = var.europe-public-ip-id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.europe-subnet-id
  }
}


resource "azurerm_virtual_network_gateway_connection" "us_to_europe" {
  name                = "us-to-europe"
  location            = var.us-rg-location
  resource_group_name = var.us-rg

  type                            = "Vnet2Vnet"
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.us.id
  peer_virtual_network_gateway_id = azurerm_virtual_network_gateway.europe.id

  shared_key = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

resource "azurerm_virtual_network_gateway_connection" "europe_to_us" {
  name                = "europe-to-us"
  location            = var.europe-rg-location
  resource_group_name = var.europe-rg

  type                            = "Vnet2Vnet"
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.europe.id
  peer_virtual_network_gateway_id = azurerm_virtual_network_gateway.us.id

  shared_key = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}