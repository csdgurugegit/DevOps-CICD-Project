resource "azurerm_public_ip" "vm_publicip_sonar" {
  name                = var.sonarpublicip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm_interface_sonar" {
  name                = var.sonarvm_nic
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.sonarprivateip_name
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_publicip_sonar.id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm_sonar" {
  name                  = var.sonarvm_name
  resource_group_name   = var.rg_name
  location              = var.rg_location
  size                  = var.sonarvm_size
  admin_username        = var.sonarvm_username
  admin_password        = var.sonarvm_password
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.vm_interface_sonar.id,
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
