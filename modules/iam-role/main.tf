resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.service_principal
        }
      }
    ]
  })

  tags = merge(
    {
      Name            = var.role_name
      ApplicationID   = var.applicationid
      ApplicationName = var.applicationname
      Environment     = var.environment
    },
    var.specifictags
  )
}

# Attach managed policies
resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policies)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

# Attach inline policies
resource "aws_iam_role_policy" "inline" {
  for_each = var.inline_policies

  name   = each.key
  role   = aws_iam_role.this.id
  policy = each.value
}
