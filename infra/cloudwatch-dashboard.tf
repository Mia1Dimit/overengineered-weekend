module "cloudwatch_dashboard" {
  source   = "../modules/cloudwatch-dashboard"
  for_each = var.cloudwatch_dashboards

  name = each["name"]
  body = each["body"]

  tags = {
    applicationid   = var.applicationid
    applicationname = var.applicationname
    environment     = var.environment
  }
}
