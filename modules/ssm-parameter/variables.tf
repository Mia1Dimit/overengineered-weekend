variable "name" {
  type = string
}

variable "value" {
  type      = string
  sensitive = true
}

variable "type" {
  type    = string
  default = "SecureString"
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
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