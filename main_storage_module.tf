module "storage_account" {
  source = "./module_storage/"

  storage_account_name  = "salomonstorage"
  resource_group_name   = "salomon"
  location              = var.location
  account_tier          = "Standard"
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
