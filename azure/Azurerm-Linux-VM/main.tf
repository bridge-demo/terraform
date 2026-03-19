terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.59.0"
    }
  }
}

provider "azurerm" {
  features { }
}

data "azurerm_resource_group" "vnet" {
  name = var.virtual_network_resource_group
}

data "azurerm_resource_group" "vm_rg" {
  name = var.vm_resource_group
}

data "azurerm_subnet" "subnet_name" {
  name                 = var.az_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = data.azurerm_resource_group.vnet.name
}

resource "azurerm_network_interface" "network_interface" {
  name                          = "${var.vm_name}-${var.network_name}"
  location                      = var.region
  resource_group_name           = data.azurerm_resource_group.vm_rg.name
  tags                          = var.tags

  ip_configuration {
    name                          = "${var.vm_name}-${var.network_name}-ip"
    subnet_id                     = data.azurerm_subnet.subnet_name.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "instance" {
  depends_on                   = [azurerm_network_interface.network_interface]
  name                         = var.vm_name
  resource_group_name          = data.azurerm_resource_group.vm_rg.name
  location                     = var.region
  size                      = var.vm_size
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]
  disable_password_authentication = var.disable_password_authentication
  admin_username         = var.admin_username
  admin_password 			   = var.admin_password
  computer_name  			   = var.vm_name
  tags                         = var.tags

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = var.storage_os_disk_caching
    storage_account_type = var.storage_os_disk_managed_disk_type
    disk_size_gb         = var.storage_os_disk_size
  }
  source_image_reference  {
    publisher = var.img_publisher
    offer     = var.img_offer
    sku       = var.img_sku
    version   = var.img_version
  }
}

resource "azurerm_managed_disk" "data_disk" {
  count                = var.data_disk_enabled ? 1 : 0
  name                 = "${var.vm_name}-datadisk"
  location             = var.region
  resource_group_name  = data.azurerm_resource_group.vm_rg.name
  storage_account_type = var.data_disk_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size_gb
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.data_disk_enabled ? 1 : 0
  managed_disk_id    = azurerm_managed_disk.data_disk[0].id
  virtual_machine_id = azurerm_linux_virtual_machine.instance.id
  lun                = 0
  caching            = var.data_disk_caching
}
