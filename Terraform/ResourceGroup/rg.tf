resource "azurerm_resource_group" "vm_grp" {
  name     = var.rg_name
  location = var.rg_location
}

