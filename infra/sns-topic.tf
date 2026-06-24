module "sns_topic" {
  source = "../modules/sns-topic"
  for_each = var.sns_topics

  name         = each["name"]
  display_name = each["display_name"]
  kms_key_id   = each["kms_key_id"]

  tags = {
    applicationid   = var.applicationid
    applicationname = var.applicationname
    environment     = var.environment
  }
}
