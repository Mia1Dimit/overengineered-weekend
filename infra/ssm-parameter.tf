module ssm-parameter {
  source = "../../modules/ssm-parameter"
  for_each = var.ssm_parameters
  name = each["name"]
  type = each["type"]
  value = each["value"]
  key_id = each["key_id"]
  tags = {
    applicationid = var.applicationid
    applicationname = var.applicationname
    environment = var.environment
  }

}