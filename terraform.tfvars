workload_config = {
  name                = "Example_work_01"
  newrelic_account_id = 4399529
 
    entity_guids = [
      "NDM5OTUyOXxJTkZSQXxOQXwzMjUxNTQ3NDgyOTA5MjI5NTI0",
 "NDM5OTUyOXxBSU9QU3xDT05ESVRJT058NDA5OTkxNzM",
 "NDM5OTUyOXxWSVp8REFTSEJPQVJEfGRhOjU3ODI2NTQ",
  "NDM5OTUyOXxOUjF8V09SS0xPQUR8MjIyNTkz"
    ]
    scope_account_ids         = [4399529]
    description               = "Workload combining static and dynamic entities"
    static_status             = "DEGRADED"
    static_status_description = "Scheduled maintenance in progress"
    static_status_summary     = "Maintenance mode"
    rule_strategy             = "BEST_STATUS_WINS"
    rule_threshold_type       = "FIXED"
    rule_threshold_value      = 100
  }