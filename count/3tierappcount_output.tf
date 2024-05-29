output "module_web_vm_public_ip_count" {
  value = azurerm_public_ip.web.*.ip_address
}
