output "k8_subnet_out" {
     value = azurerm_subnet.k8_subnet.id
}

output "vms_subnet_out" {
     value = azurerm_subnet.vms_subnet.id
}