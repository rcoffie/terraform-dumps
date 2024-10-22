# Connecting two Azure network using global Vnet Peering

* Task1
  * Create a virtual Machine to test the configuration
  * Create a virtual Machine link to the manufacturing VNET/ ManufacturingSystemaSubnet
  * Nam the virtual machine Manufacturing VM
  * VM size = Standard_DS1_v2
  * Take note of the IP address of manufacturing VM
  * Take note of the IP address of TestVM 1
  * Try connecting to TestVM1 from ManufacturingVM via RTCP from powershell
  * <mark> Test -NetConnection 10.20.0.4 - port 3389</mark>
* Task 2
  * Connect to the test Vms using RDP
* Task 3
  * Test the connection between the VMs
* Task 4
  * Create VNet peerings between CoreServices and Manufacturing Vnet
    * Create a VNET Perring from the CoreservicesVNET to ManufacturingVNet
    * Traffic to remote virtual network &rarr; select Allow(Default)
    * Traffic Forwarded from remote vitual network &rarr; Allow(Default)
    * Route server &rarr; None
* Task 5
  * Test the connection between the VMs
  