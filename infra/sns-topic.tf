module "sns_topic" {
  source   = "../modules/sns-topic"
  for_each = var.sns_topics

  name              = each.value.name
  display_name      = each.value.display_name
  kms_master_key_id = each.value.kms_key_id

  applicationid   = var.applicationid
  applicationname = var.applicationname
  environment     = var.environment
  specifictags    = {}
}
