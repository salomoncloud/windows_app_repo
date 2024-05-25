variable "subscription_id"{
  type=string
}
variable "admin_password"{
type=string
}
variable "admin_username"{
type=string
}
variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "account_tier"{
  type=string
  default="Standard"
}
variable "account_replication_type"{
  type=string
  default="GRS"
}
variable "access_tier"{
  type=string
  default="Cool"
}
variable "cross_tenant_replication_enabled"{
 type=bool
 default=false
}
variable "prefix"{
 type=string
 default="salomon"
}
variable "environment"{
 type=string
 default="staging"
}
variable "waf_ip_add" {
  type = list(string)
}
variable "rule_uno" {
  type = string
}
variable "top_priority" {
  type = number
}
variable "matchrule" {
  type = string
}
variable "varname" {
  type = string
}
variable "blockaction" {
  type = string
}
variable "rule_dos" {
  type = string
}
variable "highpriority" {
  type = number
}
variable "reqhead" {
  type = string
}
variable "useragent" {
  type = string
}
variable "ipmatch" {
  type = string
}
variable "location" {
type = string
}
variable "resource_group_name" {
type = string
}
variable "frontend_subnet_name" {
  type = string
  default = ""
}
variable "frontend_vnet_name" {
  type = string
}
variable "type" {
  type = string
  default = "public"
}
variable "pip_ddos_protection_plan_id" {
  type = string
  default = ""
}
variable "pip_idle_timeout_in_minutes" {
  type = number
  default = 30
}
variable "pip_ddos_protection_mode" {
  type = string
  default = "Disabled"
}
variable "pip_sku" {
  type = string
  default = "Basic"
}
variable "pip_ip_version" {
  type = string
  default = "IPv4"
}
variable "pip_zones" {
  type = list(string)
  default = []
}
variable "pip_public_ip_prefix_id" {
  type = string
  default = ""
}
variable "pip_ip_tags" {
  type = map(string)
  default = {}
}
variable "tags" {
  type = map(string)
  default = {}
}
variable "tracing_tags_enabled" {
  type = bool
  default = false
}
variable "tracing_tags_prefix" {
  type = string
  default = ""
}
variable "edge_zone" {
  type = string
  default = ""
}
variable "pip_reverse_fqdn" {
  type = string
  default = ""
}
variable "allocation_method" {
  description = "Allocation method for the public IP"
  type = string
  default = "Dynamic"
}
variable "lb_sku" {
  type        = string
  default     = "Basic"
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard."
}
variable "lb_sku_tier" {
  type        = string
  default     = "Regional"
  description = "(Optional) The SKU tier of this Load Balancer. Possible values are `Global` and `Regional`. Defaults to `Regional`. Changing this forces a new resource to be created."
}
variable "frontend_private_ip_address_version" {
  type        = string
  default     = null
  description = "(Optional) The version of IP that the Private IP Address is. Possible values are `IPv4` or `IPv6`."
}
variable "frontend_ip_zones" {
  type        = set(string)
  default     = null
  description = "(Optional) A collection containing the availability zone to allocate the IP in. Changing this forces a new resource to be created. Availability Zones are only supported with a [Standard SKU](https://docs.microsoft.com/azure/virtual-network/virtual-network-ip-addresses-overview-arm#standard) and [in select regions](https://docs.microsoft.com/azure/availability-zones/az-overview) at this time. Standard SKU Public IP Addresses that do not specify a zone are **not** zone-redundant by default."
}
variable "frontend_private_ip_address" {
  type        = string
  default     = ""
  description = "(Optional) Private ip address to assign to frontend. Use it with type = private"
}
variable "frontend_name" {
  type        = string
  default     = "myPublicIP"
  description = "(Required) Specifies the name of the frontend ip configuration."
}
variable "frontend_private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "(Optional) Frontend ip allocation type (Static or Dynamic)"
}
