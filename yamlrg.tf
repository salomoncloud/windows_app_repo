locals {
  vms = yamldecode(file("${path.module}/rg/rg.yaml"))

  vms_list = [for vm in local.vms.vms : {
    name = vm.name
    size = vm.size
  }]
}
