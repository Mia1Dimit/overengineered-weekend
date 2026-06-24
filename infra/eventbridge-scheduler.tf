module "eventbridge_scheduler" {
  source = "../../modules/eventbridge-scheduler"
  for_each = var.eventbridge_schedulers

  group_name        = each["group_name"]
  schedule           = each["schedule"]
  timezone           = each["timezone"]
  flexible_window    = each["flexible_window"]
  max_age_hours      = each["max_age_hours"]
  max_retry_attempts = each["max_retry_attempts"]
  max_event_age      = each["max_event_age"]

  tags = {
    applicationid   = var.applicationid
    applicationname = var.applicationname
    environment     = var.environment
  }
}
