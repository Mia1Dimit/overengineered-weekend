module "iam_role" {
  source   = "../modules/iam-role"
  for_each = var.iam_roles

  role_name         = each.value.name
  service_principal = each.value.service_principal
  managed_policies  = each.value.managed_policies
  inline_policies   = each.value.inline_policies

  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
  specifictags    = {}
}
