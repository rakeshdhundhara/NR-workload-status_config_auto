variable "workload_config" {
  type = object({
    name                        = string
    newrelic_account_id         = number
    entity_guids                = list(string)
    scope_account_ids           = list(number)
    description                 = string
    static_status               = string
    static_status_description   = string
    static_status_summary       = string
    rule_strategy               = string
    rule_threshold_type         = string
    rule_threshold_value        = number
  })
}
