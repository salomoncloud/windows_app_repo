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
variable "pip_domain_name_label" {
  type = string
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
variable "pip_sku_tier" {
  type = string
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
variable "allocation_method" {
  type = string
}
variable "edge_zone" {
  type = string
  default = ""
}
variable "pip_reverse_fqdn" {
  type = string
  default = ""
}
