module "dynamodb" {
  source   = "../modules/dynamodb"
  for_each = var.dynamodb_tables

  name           = each["name"]
  billing_mode   = each["billing_mode"]
  read_capacity  = each["read_capacity"]
  write_capacity = each["write_capacity"]
  hash_key       = each["hash_key"]
  range_key      = each["range_key"]
  ttl_attribute  = each["ttl_attribute"]

  tags = {
    applicationid   = var.applicationid
    applicationname = var.applicationname
    environment     = var.environment
  }
}
