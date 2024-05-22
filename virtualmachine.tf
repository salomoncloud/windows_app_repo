locals {
  vms = yamldecode(file("${path.module}/vm/virtualmachine.yaml"))

  vms_list = flatten([
    for app in local.virtualmachine.listofvms : [
      {
        name     = vms.name
        size     = Standard_DS1_v2
      }
    ]
  ])
}

resource "azurerm_virtual_network" "main" {
  name                = "salomon_net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.salomon.location
  resource_group_name = azurerm_resource_group.salomon.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.salomon.name
  virtual_network_name = azurerm_virtual_network.salomon_net.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "salomon_nic"
  location            = azurerm_resource_group.salomon.location
  resource_group_name = azurerm_resource_group.salomon.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.salomon.location
  resource_group_name   = azurerm_resource_group.salomon.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
