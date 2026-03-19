variable "vm_name" {
  description = "Specifies the name of the Virtual Machine."
  type        = string
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
  default	  ="Standard_D4s_v3"
}

variable "vm_resource_group" {
  description = "Azure Resource Group in which vm should be created"
  type        = string
  default     = "rg-1lab-a-031-opaas"
}

variable "disable_password_authentication" {
  description = "Specifies whether password authentication should be disabled"
  type        = bool
  default     = false
}

variable "admin_username" {
  description = "User name credential for the VM."
  type        = string
  default     = "az-root"
}
variable "admin_password" {
  description = "User name credential for the VM."
  type        = string
  default     = "PassW@rd12345"
}
variable "img_publisher" {
  description = "The organization that created the image. Examples: Canonical, MicrosoftWindowsServer"
  type        = string
  default     = "RedHat"
}

variable "img_offer" {
  description = "The name of a group of related images created by a publisher. Examples: UbuntuServer, WindowsServer"
  type        = string
  default     = "RHEL"
}

variable "img_sku" {
  description = "An instance of an offer, such as a major release of a distribution. Examples: 18.04-LTS, 2019-Datacenter"
  type        = string
  default     = "810-gen2"
}

variable "img_version" {
  description = "The version number of an image SKU."
  type        = string
  default     = "latest"
}

variable "storage_os_disk_caching" {
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
  type        = string
  default     = "ReadWrite"
}

variable "storage_os_disk_managed_disk_type" {
  description = "Specifies the type of managed disk to create. Value must be either Standard_LRS or Premium_LRS. Cannot be used when vhd_uri is specified."
  type        = string
  default     = "Standard_LRS"
}

variable "storage_os_disk_size" {
  description = "Specifies the size of the OS Disk in gigabytes."
  type        = string
  default     = "64"
}

variable "virtual_network_resource_group" {
  description = "Resource Group for virtual Network"
  type        = string
  default     = "rg-1lab-a-031-opaas"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-1lab-031-01"
}

variable "az_subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "sbnt-1lab-031-vn01as01-01"
}

variable "network_name" {
  description = "The name of the network interface"
  type        = string
  default     = "internal"
}

variable "region" {
  description = "Location for Azure site"
  type        = string
  default     = "centralus"
}

variable "tags" {
  description = "list of tags to create for resoureces"
  type        = map(string)
  default = {
    "createdBy" = "poa/terraform"
  }
}

variable "data_disk_enabled" {
  description = "Whether to attach a data disk to the VM"
  type        = bool
  default     = false
}

variable "data_disk_size_gb" {
  description = "Size of the data disk in GB"
  type        = number
  default     = 100
}

variable "data_disk_caching" {
  description = "Caching type for data disk (None, ReadOnly, ReadWrite)"
  type        = string
  default     = "ReadWrite"
}

variable "data_disk_storage_account_type" {
  description = "Storage account type for data disk (Standard_LRS, Premium_LRS, StandardSSD_LRS)"
  type        = string
  default     = "Standard_LRS"
}
