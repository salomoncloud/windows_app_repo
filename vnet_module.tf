module "vnet_salomon" {
  source              = "./count/"
  resource_group_name = var.resource_group_name
  location            = var.location
}
