variable "subnet_name" {
  description = "Name of the existing subnet"
  type        = string
  default     = "sbnt-1lab-031-vn01as01-01"
}

variable "virtual_network_name" {
  description = "Name of the existing virtual network"
  type        = string
  default     = "vnet-1lab-031-01"
}

variable "subnet_resource_group_name" {
  description = "Resource group name where the subnet exists"
  type        = string
  default     = "rg-1lab-a-031-opaas"
}

variable "network_interface_name" {
  description = "Name for the network interface"
  type        = string
  default     = "testtfcloud"
}

variable "location" {
  description = "Azure region for the network interface"
  type        = string
  default     = "Central US"
}

variable "resource_group_name" {
  description = "Resource group name for the network interface"
  type        = string
  default     = "rg-1lab-a-031-opaas"
}

variable "ip_configuration_name" {
  description = "Name for the IP configuration"
  type        = string
  default     = "internal"
}

variable "private_ip_allocation" {
  description = "Private IP address allocation method"
  type        = string
  default     = "Dynamic"
  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_allocation)
    error_message = "Private IP allocation must be either 'Dynamic' or 'Static'."
  }
}

variable "tags" {
  description = "Tags to apply to the network interface"
  type        = map(string)
  default     = {}
}
