resource "azurerm_virtual_network" "vm_network" {
  name                = "vNET"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "k8_subnet" {
  name                 = "K8-Subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = ["192.168.1.0/24"] 
}

resource "azurerm_subnet" "vms_subnet" {
  name                 = "VMs-Subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = ["192.168.2.0/24"] 
}
