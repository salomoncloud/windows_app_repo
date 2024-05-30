resource "azurerm_resource_group" "vnet_rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_virtual_network" "vnet_challenge" {
  name                = var.vnet_name_two
  address_space       = var.vnet_address_space_two
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}
variable "vnet_name_two" {
  type = string
  default = "myVNet_forSalomon"
}

variable "vnet_address_space_two" {
  type = list(string)
  default = ["10.0.1.0/16"]
}
