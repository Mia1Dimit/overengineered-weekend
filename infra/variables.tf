variable "applicationid" {
  description = "Application ID for tagging"
  type        = string
}

variable "applicationname" {
  description = "Application name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "iam_roles" {
  description = "IAM role configurations"
  type = map(object({
    name               = string
    assume_role_policy = string
    specifictags       = optional(map(string), {})
    policies = optional(map(object({
      name   = string
      policy = string
    })), {})
    managed_policies = optional(map(object({
      policy_arn = string
    })), {})
  }))
  default = {}
}

variable "dynamodb_tables" {
  description = "DynamoDB table configurations"
  type = map(object({
    name           = string
    billing_mode   = string
    read_capacity  = optional(number, 5)
    write_capacity = optional(number, 5)
    hash_key       = string
    range_key      = optional(string)
    ttl_attribute  = optional(string)
  }))
  default = {}
}

variable "lambda_functions" {
  description = "Lambda function configurations"
  type = map(object({
    name                  = string
    handler               = string
    runtime               = string
    timeout               = optional(number, 30)
    memory_size           = optional(number, 128)
    environment_variables = optional(map(string), {})
    vpc_config = optional(object({
      subnet_ids         = list(string)
      security_group_ids = list(string)
    }))
  }))
  default = {}
}

variable "sns_topics" {
  description = "SNS topic configurations"
  type = map(object({
    name         = string
    display_name = optional(string)
    kms_key_id   = optional(string)
  }))
  default = {}
}

variable "eventbridge_schedulers" {
  description = "EventBridge Scheduler configurations"
  type = map(object({
    name                 = string
    schedule_expression  = string
    target_lambda_key    = string # Key of the lambda function to target
    input                = optional(string)
    flexible_window_mode = optional(string, "OFF")
    state                = optional(string, "ENABLED")
  }))
  default = {}
}

variable "cloudwatch_dashboards" {
  description = "CloudWatch Dashboard configurations"
  type = map(object({
    name    = string
    dashboard_widgets = list(any)
  }))
  default = {}
}

variable "ssm_parameters" {
  description = "SSM Parameter configurations"
  type = map(object({
    name   = string
    type   = string
    value  = string
    key_id = optional(string)
  }))
  default = {}
}
