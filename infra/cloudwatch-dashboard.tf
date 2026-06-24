module "cloudwatch_dashboard" {
  source   = "../modules/cloudwatch-dashboard"
  for_each = var.cloudwatch_dashboards

  dashboard_name  = each["name"]
  dashboard_body  = each["body"]
  name            = each["name"]
  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
}
