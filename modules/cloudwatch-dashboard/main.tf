resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard" {
  dashboard_name = var.dashboard_name
  dashboard_body = jsonencode({
    widgets = var.dashboard_widgets
  })
  tags = local.merged_tags
}
