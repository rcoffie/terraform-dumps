resource "azurerm_resource_group" "az-700-RG" {
  name     = var.azurerm_resource_group_name
  location = var.eastus_location
}



resource "azurerm_virtual_network" "CoreServices-vnet-R" {
  name                = "CoreServices-vnet"
  location            = azurerm_resource_group.az-700-RG.location
  resource_group_name = azurerm_resource_group.az-700-RG.name
  address_space       = ["10.20.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}

resource "azurerm_subnet" "CoreServices-GateWay-Subnet" {
  name                 = "CoreServices-GateWay-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.CoreServices-vnet-R.name
  address_prefixes     = ["10.20.0.0/27"]


}

resource "azurerm_subnet" "CoreServices-SharedServices-Subnet" {
  name                 = "CoreServices-SharedServices-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.CoreServices-vnet-R.name
  address_prefixes     = ["10.20.10.0/24"]


}

resource "azurerm_subnet" "CoreServices-Database-Subnet" {
  name                 = "CoreServices-Database-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.CoreServices-vnet-R.name
  address_prefixes     = ["10.20.20.0/24"]


}

resource "azurerm_subnet" "CoreServices-PublicWebServices-Subnet" {
  name                 = "CoreServices-PublicWebServices-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.CoreServices-vnet-R.name
  address_prefixes     = ["10.20.30.0/24"]


}

resource "azurerm_virtual_network" "Manufacturing-vnet-R" {
  name                = "Manufacturing-vnet"
  location            = var.westus_location
  resource_group_name = azurerm_resource_group.az-700-RG.name
  address_space       = ["10.30.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]




}

resource "azurerm_subnet" "Manufacturing-ManufacturingSystem-Subnet" {
  name                 = "Manufacturing-ManufacturingSystem-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.Manufacturing-vnet-R.name
  address_prefixes     = ["10.30.10.0/24"]


}

resource "azurerm_subnet" "Manufacturing-Sensor-Subnet1" {
  name                 = "Manufacturing-Sensor-subnet1"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.Manufacturing-vnet-R.name
  address_prefixes     = ["10.30.20.0/24"]


}

resource "azurerm_subnet" "Manufacturing-Sensor-Subnet2" {
  name                 = "Manufacturing-Sensor-subnet2"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.Manufacturing-vnet-R.name
  address_prefixes     = ["10.30.21.0/24"]


}

resource "azurerm_subnet" "Manufacturing-Sensor-Subnet3" {
  name                 = "Manufacturing-Sensor-subnet3"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.Manufacturing-vnet-R.name
  address_prefixes     = ["10.30.22.0/24"]


}





resource "azurerm_virtual_network" "Research-vnet-R" {
  name                = "Research-vnet"
  location            = var.east_europe_location
  resource_group_name = azurerm_resource_group.az-700-RG.name
  address_space       = ["10.40.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]



}


resource "azurerm_subnet" "Research-ResearchSystem-Subnet" {
  name                 = "Research-ResearchSystem-subnet"
  resource_group_name  = azurerm_resource_group.az-700-RG.name
  virtual_network_name = azurerm_virtual_network.Research-vnet-R.name
  address_prefixes     = ["10.40.0.0/24"]


}


# # Creating Private DNS Zone 

resource "azurerm_private_dns_zone" "az-700-pdns-R" {
  name                = "azvent.com"
  resource_group_name = var.azurerm_resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "CoreServices-network-link" {
  name                  = "CoreServices-network-link"
  resource_group_name   = azurerm_resource_group.az-700-RG.name
  private_dns_zone_name = azurerm_private_dns_zone.az-700-pdns-R.name
  virtual_network_id    = azurerm_virtual_network.Manufacturing-vnet-R.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing-network-link" {
  name                  = "manufacturing-network-link"
  resource_group_name   = azurerm_resource_group.az-700-RG.name
  private_dns_zone_name = azurerm_private_dns_zone.az-700-pdns-R.name
  virtual_network_id    = azurerm_virtual_network.CoreServices-vnet-R.id
}




resource "azurerm_private_dns_zone_virtual_network_link" "Research-network-link" {
  name                  = "Research-network-link"
  resource_group_name   = azurerm_resource_group.az-700-RG.name
  private_dns_zone_name = azurerm_private_dns_zone.az-700-pdns-R.name
  virtual_network_id    = azurerm_virtual_network.Research-vnet-R.id
}

# resource "azurerm_private_dns_a_record" "az-700-record-R" {
#   name                = "az-700-record"
#   zone_name           = azurerm_private_dns_zone.az-700-pdns-R.name
#   resource_group_name = azurerm_resource_group.az-700-RG.name
#   ttl                 = 300
#   records             = ["10.0.0.0/16", "10.30.0.0/16", ]
# }

# Create public ip for east us vms
resource "azurerm_public_ip" "az-700-eastus-pip-R" {
  name                = "az-700-pip"
  location            = azurerm_resource_group.az-700-RG.location
  resource_group_name = azurerm_resource_group.az-700-RG.name
  allocation_method   = "Dynamic"
}

# Create network interface
resource "azurerm_network_interface" "az-700-eastus-vm-nic-R" {
  name                = "az-700-eastus-vm-nic"
  location            = azurerm_resource_group.az-700-RG.location
  resource_group_name = azurerm_resource_group.az-700-RG.name

  ip_configuration {
    name                          = "az_700_eastus_vm_nic_configuration"
    subnet_id                     = azurerm_subnet.CoreServices-GateWay-Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az-700-eastus-pip-R.id
  }
}


 