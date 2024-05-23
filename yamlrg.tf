locals {
  rg = yamldecode(file("${path.module}/rg/rg.yaml"))

  resource_group_list = [
    for rg_entry in local.rg.rg : {
      name     = rg_entry.name
      location = rg_entry.location
    }
  ]
}

resource "azurerm_resource_group" "example" {
  for_each = { for rg in local.resource_group_list : rg.name => rg }

  name     = each.value.name
  location = each.value.location
}
