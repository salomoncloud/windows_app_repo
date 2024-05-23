locals {
  rg = yamldecode(file("${path.module}/rg/rg.yaml"))

  resource_group_list = [for rg in local.rg.rg : {
  name: resource_group.name
  location: resource_group.location
  }]
}
