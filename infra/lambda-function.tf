module "lambda_function" {
  source = "../../modules/lambda-function"
  for_each = var.lambda_functions

  name                  = each["name"]
  handler               = each["handler"]
  runtime               = each["runtime"]
  timeout               = each["timeout"]
  memory_size           = each["memory_size"]
  environment_variables = each["environment_variables"]
  vpc_config            = each["vpc_config"]

  tags = {
    applicationid   = var.applicationid
    applicationname = var.applicationname
    environment     = var.environment
  }
}
