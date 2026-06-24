module "eventbridge_scheduler" {
  source   = "../modules/eventbridge-scheduler"
  for_each = var.eventbridge_schedulers

  name                      = each["name"]
  schedule_expression       = each["schedule_expression"]
  target_arn                = module.lambda_function[each["target_lambda_key"]].arn
  role_arn                  = aws_iam_role.scheduler_execution.arn
  input                     = each["input"]
  flexible_time_window_mode = each["flexible_window_mode"]
  state                     = each["state"]

  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment

  depends_on = [module.lambda_function]
}
