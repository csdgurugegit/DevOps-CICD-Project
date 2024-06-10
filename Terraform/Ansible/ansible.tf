resource "azurerm_public_ip" "vm_publicip_ansible" {
  name                = var.ansiblepublicip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm_interface_ansible" {
  name                = var.ansiblevm_nic
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ansibleprivateip_name
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_publicip_ansible.id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm_ansible" {
  name                  = var.ansiblevm_name
  resource_group_name   = var.rg_name
  location              = var.rg_location
  size                  = var.ansiblevm_size
  admin_username        = var.ansiblevm_username
  admin_password        = var.ansiblevm_password
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.vm_interface_ansible.id,
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
