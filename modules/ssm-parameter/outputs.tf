output "parameter_name" { 
    description = "Name of the SSM parameter"
    value = aws_ssm_parameter.ssm_parameter.name 
}

output "parameter_arn" { 
    description = "ARN of the SSM parameter"
    value = aws_ssm_parameter.ssm_parameter.arn 
}

output "parameter_version" { 
    description = "Version of the SSM parameter"
    value = aws_ssm_parameter.ssm_parameter.version 
}

output "parameter_value" {
  description = "Value of the SSM parameter"
  value       = aws_ssm_parameter.ssm_parameter.value
  sensitive   = true
}