resource "azurerm_resource_group" "salomon" {
  name     = "salomon_win_app"
  location = "canada central"
}

locals {
  windows_app = yamldecode(file("${path.module}/dev/windows_apps.yaml"))

  windows_app_list = flatten([
    for app in local.windows_app.listofwindowsapp : [
      {
        name     = app.name
        os_type  = app.os_type
        sku_name = app.sku_name
      }
    ]
  ])
}

resource "azurerm_service_plan" "windows_salomon_app" {
  count               = length(local.windows_app_list)
  name                = "windowssalomonapp-${count.index}"
  resource_group_name = azurerm_resource_group.salomon.name
  location            = azurerm_resource_group.salomon.location
  os_type             = local.windows_app_list[count.index].os_type
  sku_name            = local.windows_app_list[count.index].sku_name
}

resource "azurerm_windows_web_app" "win_salomon" {
  count               = length(local.windows_app_list)
  name                = local.windows_app_list[count.index].name
  resource_group_name = azurerm_resource_group.salomon.name
  location            = azurerm_service_plan.windows_salomon_app[count.index].location
  service_plan_id     = azurerm_service_plan.windows_salomon_app[count.index].id

  site_config {}
}

resource "azurerm_virtual_network" "salomon_net" {
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

resource "azurerm_virtual_machine" "main" {
  count                 = 5
  name                  = local.vm_names[count.index]
  location              = azurerm_resource_group.salomon.location
  resource_group_name   = azurerm_resource_group.salomon.name
  network_interface_ids = [azurerm_network_interface.salomon_nic[count.index].id]  # Corrected to match the count index
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${local.vm_names[count.index]}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = local.vm_names[count.index]
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

locals {
  vm_names = ["firstvm", "secondvm", "thirdvm", "fourthvm", "fifthvm"]
}
