output "iam_role_arns" {
  description = "IAM role ARNs"
  value       = { for k, v in module.iam_role : k => v.arn }
}

output "iam_role_names" {
  description = "IAM role names"
  value       = { for k, v in module.iam_role : k => v.name }
}

output "dynamodb_table_names" {
  description = "DynamoDB table names"
  value       = { for k, v in module.dynamodb : k => v.name }
}

output "dynamodb_table_arns" {
  description = "DynamoDB table ARNs"
  value       = { for k, v in module.dynamodb : k => v.arn }
}

output "lambda_function_arns" {
  description = "Lambda function ARNs"
  value       = { for k, v in module.lambda_function : k => v.arn }
}

output "lambda_function_names" {
  description = "Lambda function names"
  value       = { for k, v in module.lambda_function : k => v.name }
}

output "sns_topic_arns" {
  description = "SNS topic ARNs"
  value       = { for k, v in module.sns_topic : k => v.arn }
}

output "sns_topic_names" {
  description = "SNS topic names"
  value       = { for k, v in module.sns_topic : k => v.name }
}

output "eventbridge_scheduler_arns" {
  description = "EventBridge Scheduler ARNs"
  value       = { for k, v in module.eventbridge_scheduler : k => v.arn }
}

output "cloudwatch_dashboard_urls" {
  description = "CloudWatch Dashboard URLs"
  value       = { for k, v in module.cloudwatch_dashboard : k => v.url }
}

output "ssm_parameter_arns" {
  description = "SSM Parameter ARNs"
  value       = { for k, v in module.ssm_parameter : k => v.arn }
}

output "ssm_parameter_values" {
  description = "SSM Parameter values"
  value       = { for k, v in module.ssm_parameter : k => v.value }
  sensitive   = true
}
