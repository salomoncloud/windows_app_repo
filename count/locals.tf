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
variable "web_subnet_name_two" {
  type = string
  default = "web-subnet-two"
}
variable "web_subnet_prefixes_two" {
  type = list(string)
  default = ["10.0.1.0/24"]
}
variable "vnet_address_space_two" {
  type = list(string)
  default = ["10.0.1.0/16"]
}
resource "azurerm_subnet" "web_two" {
  name                 = var.web_subnet_name_two
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_prefixes_two
}
