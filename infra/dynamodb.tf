module "dynamodb" {
  source   = "../modules/dynamodb"
  for_each = var.dynamodb_tables

  table_name         = each["name"]
  name               = each["name"]
  hash_key           = each["hash_key"]
  range_key          = each["range_key"]
  billing_mode       = each["billing_mode"]
  read_capacity      = each["read_capacity"]
  write_capacity     = each["write_capacity"]
  ttl_attribute_name = each["ttl_attribute"]
  applicationid      = var.applicationid
  applicationname    = var.applicationname
  environment        = var.environment
}
