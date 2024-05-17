locals {
  waf_policy = [for f in fileset("${path.module}/waf", "[^_]*.yaml") : yamldecode(file("${path.module}/waf/${f}"))]
  azurewafpolicy_list = flatten([
    for app in local.waf_policy: [
      for azurewaf in try(app.listofwafpolicy, []) : {
        name = azurewaf.policyname
      }
    ]
  ])
  first_ip = var.waf_ip_add[0]
}

output "first_ip_output" {
  value = local.first_ip
}

# Define the resource using the local value
resource "azurerm_web_application_firewall_policy" "my_first_waf" {
  for_each            = { for sp in local.azurewafpolicy_list: "${sp.name}" => sp }
  name                = each.value.name
  resource_group_name = azurerm_resource_group.salomon.name
  location            = azurerm_resource_group.salomon.location

  custom_rules {
    name      = "Rule1"
    priority  = 1
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }

      operator           = "IPMatch"
      negation_condition = false
      match_values       = var.waf_ip_add
    }

    action = "Block"
  }

  custom_rules {
    name      = "Rule2"
    priority  = 2
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }

      operator           = "IPMatch"
      negation_condition = false
      match_values       = [local.first_ip] 
    }

    match_conditions {
      match_variables {
        variable_name = "RequestHeaders"
        selector      = "UserAgent"
      }

      operator           = "Contains"
      negation_condition = false
      match_values       = ["Windows"]
    }

    action = "Block"
  }

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    exclusion {
      match_variable          = "RequestHeaderNames"
      selector                = "x-company-secret-header"
      selector_match_operator = "Equals"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "too-tasty"
      selector_match_operator = "EndsWith"
    }

    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
        rule {
          id      = "920300"
          enabled = true
          action  = "Log"
        }

        rule {
          id      = "920440"
          enabled = true
          action  = "Block"
        }
      }
    }
  }
}
