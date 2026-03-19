output "private_ip" {
  value = azurerm_network_interface.network_interface.private_ip_address
}

output "instance_id" {
  value = azurerm_linux_virtual_machine.instance.id
}

output "data_disk_id" {
  description = "The ID of the data disk (if created)"
  value       = var.data_disk_enabled ? azurerm_managed_disk.data_disk[0].id : null
}

output "data_disk_name" {
  description = "The name of the data disk (if created)"
  value       = var.data_disk_enabled ? azurerm_managed_disk.data_disk[0].name : null
}
