waf_ip_add = ["192.168.1.0/24", "10.0.0.0/24"]
rule_uno = "Rule1"
top_priority = 1
matchrule = "MatchRule"
varname = "RemoteAddr"
blockaction = "Block"
rule_dos = "Rule2"
highpriority = 2
reqhead = "RequestHeaders"
useragent = "UserAgent"
ipmatch = "IPMatch"
location = "canada east"
resource_group_name = "lb-name"
frontend_subnet_name = "example-subnet"
frontend_vnet_name = "example-vnet"
type = "public"
allocation_method = "Static"
name = "lb_name"
