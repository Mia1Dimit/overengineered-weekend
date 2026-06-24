# Lambda Execution Role
resource "aws_iam_role" "lambda_execution" {
  name = "sleep-push-${var.environment}-lambda-execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name            = "sleep-push-${var.environment}-lambda-execution"
    ApplicationID   = var.applicationid
    ApplicationName = var.applicationname
    Environment     = var.environment
  }
}

# Basic execution policy for Lambda (CloudWatch logs)
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# SNS publish policy for Lambda
resource "aws_iam_role_policy" "lambda_sns_publish" {
  name = "sleep-push-${var.environment}-lambda-sns-publish"
  role = aws_iam_role.lambda_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Publish"
        ]
        Resource = "*"
      }
    ]
  })
}

# EventBridge Scheduler Role
resource "aws_iam_role" "scheduler_execution" {
  name = "sleep-push-${var.environment}-scheduler-execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "scheduler.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name            = "sleep-push-${var.environment}-scheduler-execution"
    ApplicationID   = var.applicationid
    ApplicationName = var.applicationname
    Environment     = var.environment
  }
}

# Scheduler policy to invoke Lambda
resource "aws_iam_role_policy" "scheduler_invoke_lambda" {
  name = "sleep-push-${var.environment}-scheduler-invoke-lambda"
  role = aws_iam_role.scheduler_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "lambda:InvokeFunction"
        ]
        Resource = "*"
      }
    ]
  })
}
