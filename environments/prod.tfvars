# Production environment configuration
applicationid   = "002"
applicationname = "Sleep Push"
environment     = "prod"
region          = "eu-west-1"

# IAM roles configuration
iam_roles = {
  /*
  lambda_execution = {
    name               = "sleep-push-prod-lambda-execution"
    assume_role_policy = "lambda-assume.json"
    policies = {
      sns_publish = {
        name   = "sleep-push-prod-sns-publish"
        policy = "sns-publish.json"
      }
    }
    managed_policies = {
      basic_execution = {
        policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
      }
    }
  }
  scheduler_execution = {
    name               = "sleep-push-prod-scheduler-execution"
    assume_role_policy = "scheduler-assume.json"
    policies = {
      invoke_lambda = {
        name   = "sleep-push-prod-invoke-lambda"
        policy = "invoke-lambda.json"
      }
    }
    managed_policies = {}
  }
  */
}

# DynamoDB tables configuration
dynamodb_tables = {
  /*
  sleep_events = {
    name          = "sleep-push-prod-events"
    billing_mode  = "PAY_PER_REQUEST"
    hash_key      = "user_id"
    range_key     = "timestamp"
    ttl_attribute = "expiration_time"
  }
  */
}

# Lambda functions configuration
lambda_functions = {
  /*
  bedtime_reminder = {
    name        = "sleep-push-prod-bedtime-reminder"
    handler     = "index.handler"
    runtime     = "python3.11"
    timeout     = 30
    memory_size = 128
    source_dir  = "lambda_code/"
    output_path = "/tmp/bedtime_reminder.zip"
    environment_variables = {
      NOTIFICATION_MESSAGE = "Go to bed"
      SNS_TOPIC_ARN        = "arn:aws:sns:eu-west-1:577638377042:sleep-push-prod-notifications"
    }
  }
  */
}

# SNS topics configuration
sns_topics = {
  /*
  sleep_notifications = {
    name         = "sleep-push-prod-notifications"
    display_name = "Sleep Push Notifications"
  }
  */
}

# EventBridge schedulers configuration
eventbridge_schedulers = {
  /*
  bedtime_reminder_schedule = {
    name                      = "sleep-push-prod-bedtime-reminder"
    schedule_expression       = "cron(0,30 21-23,0-5 ? * * *)" # Every 30 minutes from 21:30 to 05:59
    target_lambda_key         = "bedtime_reminder"
    flexible_time_window_mode = "OFF"
    state                     = "ENABLED"
  }
  */
}

# CloudWatch dashboards configuration
cloudwatch_dashboards = {
  /*
  main_dashboard = {
    name = "sleep-push-prod-dashboard"
    dashboard_widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/Lambda", "Invocations", "stat", "Sum"],
            ["AWS/Lambda", "Errors", "stat", "Sum"],
            ["AWS/Lambda", "Duration", "stat", "Average"]
          ]
          period = 300
          stat   = "Average"
          region = "eu-west-1"
          title  = "Lambda Bedtime Reminder"
        }
      }
    ]
  }
  */
}

# SSM parameters configuration
ssm_parameters = {
  /*
  notification_message = {
    name  = "/sleep-push/prod/notification-message"
    type  = "String"
    value = "Go to bed"
  }
  bedtime_hour = {
    name  = "/sleep-push/prod/bedtime-hour"
    type  = "String"
    value = "21:30"
  }
  notification_interval = {
    name  = "/sleep-push/prod/notification-interval"
    type  = "String"
    value = "30" # minutes
  }
  */
}
