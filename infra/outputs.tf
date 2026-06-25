output "iam_role_arns" {
  description = "IAM role ARNs"
  value       = { for k, v in module.aws-iam-role : k => v.iam_role_arn }
}

output "iam_role_names" {
  description = "IAM role names"
  value       = { for k, v in module.aws-iam-role : k => v.iam_role_name }
}

output "dynamodb_table_names" {
  description = "DynamoDB table names"
  value       = { for k, v in module.dynamodb : k => v.table_name }
}

output "dynamodb_table_arns" {
  description = "DynamoDB table ARNs"
  value       = { for k, v in module.dynamodb : k => v.table_arn }
}

output "lambda_function_arns" {
  description = "Lambda function ARNs"
  value       = { for k, v in module.lambda_function : k => v.lambda_function_arn }
}

output "lambda_function_names" {
  description = "Lambda function names"
  value       = { for k, v in module.lambda_function : k => v.lambda_function_name }
}

output "sns_topic_arns" {
  description = "SNS topic ARNs"
  value       = { for k, v in module.sns_topic : k => v.topic_arn }
}

output "sns_topic_names" {
  description = "SNS topic names"
  value       = { for k, v in module.sns_topic : k => v.topic_name }
}

output "eventbridge_scheduler_arns" {
  description = "EventBridge Scheduler ARNs"
  value       = { for k, v in module.eventbridge_scheduler : k => v.schedule_arn }
}

output "cloudwatch_dashboard_urls" {
  description = "CloudWatch Dashboard URLs"
  value       = { for k, v in module.cloudwatch_dashboard : k => v.dashboard_url }
}

output "ssm_parameter_arns" {
  description = "SSM Parameter ARNs"
  value       = { for k, v in module.ssm_parameter : k => v.parameter_arn }
}

output "ssm_parameter_values" {
  description = "SSM Parameter values"
  value       = { for k, v in module.ssm_parameter : k => v.parameter_name }
  sensitive   = true
}
