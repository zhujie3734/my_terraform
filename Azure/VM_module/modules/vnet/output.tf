output "subnet_id" {
    value = azurerm_subnet.jiezhu-subnet.id
}

output "nic_id" {
    value = azurerm_network_interface.jiezhu-nic.*.id
}
