
resource "azurerm_resource_group" "vm-rg" {
  name     = "vm-rg"
  location = "eastus"
}

  

resource "azurerm_network_interface" "win-vm-nic" {
  count               = 2
  name                = "win-vm-nic-${count.index}"
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name

  ip_configuration {
    name                          = "internal"
    # subnet_id                     = azurerm_subnet.example.id
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "win-vm" {
  count                 = 2
  name                  = "win-vm-${count.index}"
  location              = azurerm_resource_group.vm-rg.location
  resource_group_name   = azurerm_resource_group.vm-rg.name
  network_interface_ids = [azurerm_network_interface.win-vm-nic[count.index].id]

  size                 = "Standard_DS1_v2"
  admin_username       = "adminuser"
  admin_password       = "Password1234!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
