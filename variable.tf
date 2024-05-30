variable "instance_count" {
  type = number
  default = 3
}
variable "db_admin_username"{
type = string
}
variable "db_admin_password"{
type=string
}
variable "administrator_login"{
type=string
}
variable "administrator_login_password"{
type=string
}
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
variable "location" {
type=string
default="canada east"
}
