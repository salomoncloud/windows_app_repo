resource "azurerm_resource_group" "salomon" {
  name     = "salomon_win_app"
  location = "canada east"
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
