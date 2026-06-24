module "eventbridge_scheduler" {
  source   = "../modules/eventbridge-scheduler"
  for_each = var.eventbridge_schedulers

  name                      = each.value.name
  schedule_expression       = each.value.schedule_expression
  target_arn                = module.lambda_function[each.value.target_lambda_key].arn
  role_arn                  = module.iam_role["scheduler_execution"].arn
  input                     = each.value.input
  flexible_time_window_mode = each.value.flexible_time_window_mode
  state                     = each.value.state

  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
  specifictags    = {}

  depends_on = [module.lambda_function, module.iam_role]
}
