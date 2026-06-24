variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "service_principal" {
  description = "AWS service that assumes this role (e.g., lambda.amazonaws.com, scheduler.amazonaws.com)"
  type        = string
}

variable "managed_policies" {
  description = "List of managed policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Map of inline policy names to policy documents"
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

variable "applicationid" {
  type        = string
  description = "Application ID tag"
}

variable "applicationname" {
  type        = string
  description = "Application name tag"
}

variable "specifictags" {
  type    = map(string)
  default = {}
}
