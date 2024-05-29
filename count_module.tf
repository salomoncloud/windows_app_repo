module "three_tier_app_count" {
  source              = "./count/"
  resource_group_name = "rg"
  location            = "canadacentral"
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  count               = var.instance_count
}

output "module_web_vm_public_ip_count" {
  value = [for i in range(var.instance_count) : module.three_tier_app_count[i].module_web_vm_public_ip_count]
}
