resource "azurerm_resource_group" "salomon" {
  name     = "salomon_win_app"
  location = "canada east"
}
locals{
  windows_app=[for f in fileset("${path.module}/dev", "[^_]*.yaml") : yamldecode(file("${path.module}/dev/${f}"))]
  windows_app_list = flatten([
    for app in local.linux_app : [
      for windowsapps in try(app.listofwindowsapp, []) :{
        name=windowsapps.name
        os_type=windowsapps.os_type
        sku_name=windowsapps.sku_name     
      }
    ]
])
}
resource "azurerm_service_plan" "windows_salomon_app" {
  name                = "windowssalomonapp"
  resource_group_name = azurerm_resource_group.salomon_win_app.name
  location            = azurerm_resource_group.salomon_win_app.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_windows_web_app" "win_salomon" {
  name                = "windowsalomon"
  resource_group_name = azurerm_resource_group.salomon_win_app.name
  location            = azurerm_service_plan.salomon_win_app.location
  service_plan_id     = each.value.id

  site_config {}
}
