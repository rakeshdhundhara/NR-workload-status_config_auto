# resource "newrelic_workload" "example_workload" {
#   name       = "Example_workload-01"
#   account_id = 4399529


#   entity_guids = [
#     "NDM5OTUyOXxJTkZSQXxOQXwzMjUxNTQ3NDgyOTA5MjI5NTI0",
#     "NDM5OTUyOXxBSU9QU3xDT05ESVRJT058NDA5OTkxNzM",
#     "NDM5OTUyOXxWSVp8REFTSEJPQVJEfGRhOjU3ODI2NTQ",
#     "NDM5OTUyOXxOUjF8V09SS0xPQUR8MjIyNTkz"
#   ]



#   scope_account_ids = [4399529]

#   description = "Workload combining static and dynamic entities"

#   status_config_automatic {
#     enabled = true
#     rule {
#       entity_guids = [
#         "NDM5OTUyOXxBUE18QVBQTElDQVRJT058MTAyNTY5ODE0Ng",
#         "NDM5OTUyOXxJTkZSQXxOQXwzMjUxNTQ3NDgyOTA5MjI5NTI0"
#       ]
#       rollup {
#         strategy        = "BEST_STATUS_WINS"
#         threshold_type  = "FIXED"
#         threshold_value = 100
#       }
#     }

#     rule {
#       entity_guids = [
#         "NDM5OTUyOXxBUE18QVBQTElDQVRJT058MTAyNTY5ODE0Ng",
#         "NDM5OTUyOXxJTkZSQXxOQXwzMjUxNTQ3NDgyOTA5MjI5NTI0"

#       ]
#       rollup {
#         strategy        = "WORST_STATUS_WINS"
#         threshold_type  = "FIXED"
#         threshold_value = 1
#       }
#     }

#     remaining_entities_rule {
#       remaining_entities_rule_rollup {
#         strategy        = "BEST_STATUS_WINS"
#         threshold_type  = "FIXED"
#         threshold_value = 100
#         group_by        = "ENTITY_TYPE"
#       }
#     }
#   }


#   status_config_static {
#     enabled     = true
#     status      = "DEGRADED"
#     description = "Scheduled maintenance in progress"
#     summary     = "Maintenance mode"
#   }
# }

resource "newrelic_workload" "example_workload" {
  name       = var.workload_config.name
  account_id = var.workload_config.newrelic_account_id

  entity_guids = var.workload_config.entity_guids

  scope_account_ids = var.workload_config.scope_account_ids

  description = var.workload_config.description

  status_config_automatic {
    enabled = true

    dynamic "rule" {
      for_each = var.workload_config.entity_guids


      content {
        entity_guids = var.workload_config.entity_guids

        rollup {
          strategy        = var.workload_config.rule_strategy
          threshold_type  = var.workload_config.rule_threshold_type
          threshold_value = var.workload_config.rule_threshold_value
        }
      }
    }


    remaining_entities_rule {
      remaining_entities_rule_rollup {
        strategy        = "BEST_STATUS_WINS"
        threshold_type  = "FIXED"
        threshold_value = 100
        group_by        = "ENTITY_TYPE"
      }
    }
  }

  status_config_static {
    enabled     = true
    status      = var.workload_config.static_status
    description = var.workload_config.static_status_description
    summary     = var.workload_config.static_status_summary
  }
}
