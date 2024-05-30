module "vnet_salomon" {
  source              = "./count/"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  admin_username_db   = var.admin_username_db
  admin_password_db   = var.admin_password_db
}
