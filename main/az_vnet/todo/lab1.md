# Introduction to Azure Virtual Networks

1. Create virtual networks and subnets
   * Create a resource group
   * Create a virtual network name
   * Create 3 virtual networks
     * CoreServices Vnet
        * location = East US
        * Address Space = 10.20.0.0/16
        * Create 4 Subnets
          * Gateway Subnet = 10.20.0.0/27
          * SharedServicesSubnet = 10.20.10.0/24
          * DatabaseSubnet = 10.20.20.0/24
          * PublicWesServiceSubnet = 10.20.30.0/24
     * ManufacturingVnet
       * Location = West US
       * Address Space = 10.30.0.0/16
       * Create 4 Subnets
         * ManufacturingSystemSubnet = 10.30.10.0/24
         * SensorSubnet  = 10.30.20.0/24
         * SensorSubnet2 = 10.30.21.0/24
         * SensorSubnet3 = 10.30.22.0/24
     * ResearchVnet
       * Location = Southeast Asia
       * Address Space = 10.40.0.0/16
       * Create 1 Subnet
       * 10.40.0.0./24  
2. Configure DNS seetings in Azure
   * Create a Private DNS Zone
   * Link the Subnet for auto registration
   * Create virtual machines to test the configuration
   * Verify records are present in the DNS zone
3. Connect two networks using Global Vnet Peering
