module "storage_account" {
  source = "./module_storage/"

  storage_account_name  = "salomon_storage"
  resource_group_name   = "salomon"
  location              = "canada east"
  account_tier          = "Standard"
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
