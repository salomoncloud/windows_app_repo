variable "subscription_id"{
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
type=list(string)
default=["192.168.1.0/24", "10.0.0.0/24"]
}
variable "rule_uno" {
type=string
default="Rule1"
}
variable "top_priority" {
type=number
default=1
}
variable "matchrule" {
type=string
default="MatchRule"
}
variable "varname" {
type=string
default="RemoteAddr"
}
variable "blockaction" {
type=string
default="Block"
}
variable "rule_dos" {
type=string
default="Rule2"
}
