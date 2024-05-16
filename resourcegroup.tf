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
