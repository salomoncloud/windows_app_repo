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
