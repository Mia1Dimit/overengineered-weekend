module "dynamodb" {
  source   = "../modules/dynamodb"
  for_each = var.dynamodb_tables

  table_name         = each.value.name
  hash_key           = each.value.hash_key
  range_key          = each.value.range_key
  billing_mode       = each.value.billing_mode
  read_capacity      = each.value.read_capacity
  write_capacity     = each.value.write_capacity
  ttl_attribute_name = each.value.ttl_attribute
  applicationid      = var.applicationid
  applicationname    = var.applicationname
  environment        = var.environment
  specifictags       = {}
}
