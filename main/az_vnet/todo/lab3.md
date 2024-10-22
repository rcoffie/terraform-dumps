# Design and Implementing Hybrid Networking

* Create resouce group az_700
   * create three virtual networks
   * CoreServiceVnet &rarr; East US
   * ManufacturingVnet &rarr; West Europe
   * ReseachVnet &rarr; Southeast Asia
 * Create Two Virtual manchines
   * CoreServicesVM 
   * ManufacturingVM 
* Test VM connection with RDP
* Test Connections between the VM's
* Create CoreServicesVnet GateWay
* CRete ManufacturingVnet GateWay
* Connect ManufacturingVnet to CoreServicesVnet 
* Verify that connections are successful
* Creating Virtual Network GateWay
   * Gateway type &rarr; VPN 
   * VPN type &rarr;  Route-base 
   * SKU &rarr; Generation1
   * Public IP address type &rarr; Basic
   * Name your Public IP address
 * Add Gateway connections for both VNETS
  