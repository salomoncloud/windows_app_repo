module "storage_account" {
  source = "./module_storage_account/"

  storage_account_name  = "mystorageaccount"
  resource_group_name   = "myresourcegroup"
  location              = "eastus"
  account_tier          = "Standard"
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
