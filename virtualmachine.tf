locals {
  vms = yamldecode(file("${path.module}/vm/virtualmachine.yaml"))

  vms_list = [for vm in local.vms.vms : {
    name = vm.name
    size = vm.size
  }]
}

resource "azurerm_virtual_machine" "secondgroup" {
  count                = length(local.vms_list)
  name                 = "${var.prefix}-${local.vms_list[count.index].name}"
  location             = azurerm_resource_group.salomon.location
  resource_group_name  = azurerm_resource_group.salomon.name
  network_interface_ids = [azurerm_network_interface.salomon_nic[count.index].id]
  vm_size              = local.vms_list[count.index].size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${local.vms_list[count.index].name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = local.vms_list[count.index].name
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
resource "azurerm_network_interface" "salomon_nic" {
  count               = 5
  name                = "salomon_nic_${count.index + 1}"
  location            = azurerm_resource_group.salomon.location
  resource_group_name = azurerm_resource_group.salomon.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
