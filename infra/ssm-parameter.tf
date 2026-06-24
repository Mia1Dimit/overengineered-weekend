module "ssm_parameter" {
  source   = "../modules/ssm-parameter"
  for_each = var.ssm_parameters

  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  kms_key_id      = each.value.key_id
  specifictags    = {}
  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
}