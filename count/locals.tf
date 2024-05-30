resource "azurerm_resource_group" "vnet_rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}
variable "vnet_name" {
  type = string
  default = "myVNet"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
