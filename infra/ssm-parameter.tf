module "ssm_parameter" {
  source   = "../modules/ssm-parameter"
  for_each = var.ssm_parameters

  name            = each["name"]
  value           = each["value"]
  type            = each["type"]
  kms_key_id      = each["key_id"]
  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
}