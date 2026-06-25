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

locals {
  common_tags = {
    Application_ID    = var.applicationid
    Application_Name  = var.applicationname
    Environment       = var.environment
    Name              = var.name
  }
  merged_tags = merge(local.common_tags, var.specifictags)
}


variable "specifictags" {
  type        = map(string)
  description = "Specific tags for the resource"
}

variable "environment" {
  type        = string
  description = "Environment Tag"
}

variable "applicationid" {
  type        = string
  description = "Application_ID Tag"
}

variable "applicationname" {
  type        = string
  description = "Application_Name Tag"
}