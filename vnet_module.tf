module "vnet_salomon" {
  source              = "./count"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  admin_username_db   = var.db_admin_username
  admin_password_db   = var.db_admin_password
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
}
