resource "azurerm_resource_group" "salomon" {
  name     = "salomon_win_app"
  location = "canada east"
}
resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.salomon_win_app.name
  location            = azurerm_resource_group.salomon_win_app.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.salomon_win_app.name
  location            = azurerm_service_plan.salomon_win_app.location
  service_plan_id     = azurerm_service_plan.salomon_win_app.id

  site_config {}
}
