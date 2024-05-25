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
variable "frontend_subnet_id" {
  type        = string
  default     = ""
  description = "(Optional) Frontend subnet id to use when in private mode"
}
variable "name" {
  type        = string
  default     = ""
  description = "(Optional) Name of the load balancer. If it is set, the 'prefix' variable will be ignored."
}
variable "pip_name" {
  type        = string
  default     = ""
  description = "(Optional) Name of public ip. If it is set, the 'prefix' variable will be ignored."
}
variable "lb_probe" {
  type        = map(any)
  default     = {}
  description = "(Optional) Protocols to be used for lb health probes. Format as [protocol, port, request_path]"
}

variable "lb_probe_interval" {
  type        = number
  default     = 5
  description = "Interval in seconds the load balancer health probe rule does a check"
}
variable "lb_probe_unhealthy_threshold" {
  type        = number
  default     = 2
  description = "Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy."
}
variable "remote_port" {
  type        = map(any)
  default     = {}
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
}
variable "lb_port" {
  type        = map(any)
  default     = {}
  description = "Protocols to be used for lb rules. Format as [frontend_port, protocol, backend_port]"
}
variable "disable_outbound_snat" {
  type        = bool
  default     = false
  description = "(Optional) Is snat enabled for this Load Balancer Rule? Default `false`."
}
variable "lb_floating_ip_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Are the Floating IPs enabled for this Load Balancer Rule? A floating IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to `false`."
}
