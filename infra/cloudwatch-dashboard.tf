module "cloudwatch_dashboard" {
  source   = "../modules/cloudwatch-dashboard"
  for_each = var.cloudwatch_dashboards

  dashboard_name    = each.value.dashboard_name
  dashboard_widgets = each.value.dashboard_widgets
  applicationid     = var.applicationid
  applicationname   = var.applicationname
  environment       = var.environment
  name              = each.value.name
  specifictags      = {}
}
