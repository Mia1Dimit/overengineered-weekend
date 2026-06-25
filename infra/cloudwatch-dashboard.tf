module "cloudwatch_dashboard" {
  source   = "../modules/cloudwatch-dashboard"
  for_each = var.cloudwatch_dashboards

  dashboard_name    = each.value.name
  dashboard_widgets = each.value.dashboard_widgets
  applicationid     = var.applicationid
  applicationname   = var.applicationname
  environment       = var.environment
  region            = var.region
  name              = each.value.name
  specifictags      = {}
}
