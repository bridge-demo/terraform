output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.azni.id
}

output "network_interface_name" {
  description = "The name of the network interface"
  value       = azurerm_network_interface.azni.name
}

output "private_ip_address" {
  description = "The private IP address assigned to the network interface"
  value       = azurerm_network_interface.azni.private_ip_address
}

output "subnet_id" {
  description = "The ID of the subnet used"
  value       = data.azurerm_subnet.subnet.id
}

output "subnet_address_prefix" {
  description = "The address prefix of the subnet"
  value       = data.azurerm_subnet.subnet.address_prefix
}
