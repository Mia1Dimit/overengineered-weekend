module "sns_topic" {
  source   = "../modules/sns-topic"
  for_each = var.sns_topics

  name              = each["name"]
  display_name      = each["display_name"]
  kms_master_key_id = each["kms_key_id"]
}
