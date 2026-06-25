variable "dashboard_name" {
  description = "Name of the CloudWatch dashboard"
  type        = string
}

variable "dashboard_widgets" {
  description = "List of widgets for the CloudWatch dashboard"
  type        = list(any)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  type        = string
  description = "Name tag for the dashboard (kept for interface consistency)"
}

variable "purpose" {
  type        = string
  description = "Purpose of the dashboard"
  default     = "Operational observability"
}
