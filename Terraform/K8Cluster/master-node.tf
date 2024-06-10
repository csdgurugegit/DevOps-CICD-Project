resource "azurerm_public_ip" "vm_publicip_master" {
  name                = var.masterpublicip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm_interface_master" {
  name                = var.mastervm_nic
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.masterprivateip_name
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_publicip_master.id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm_master" {
  name                  = var.mastervm_name
  resource_group_name   = var.rg_name
  location              = var.rg_location
  size                  = var.mastervm_size
  admin_username        = var.mastervm_username
  admin_password        = var.mastervm_password
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.vm_interface_master.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
