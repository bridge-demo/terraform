provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "rg_location" {
  description = "Resource Group Location"
  type        = string
  default     = "East US"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.rg_location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}