data "azurerm_resource_group" "rg" {
  name = "us"
  
}

resource "azurerm_resource_group" "winvm" {
  name     = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.winvm.location
  resource_group_name = azurerm_resource_group.winvm.name
}



resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.winvm.location
  resource_group_name = azurerm_resource_group.winvm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.us-subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.us-public_ip_address_id
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = var.us-rg
  location            = var.us-rg-location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}