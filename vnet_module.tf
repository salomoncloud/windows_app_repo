module "vnet_salomon" {
  source              = "./count"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
}

