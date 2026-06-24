# ⚔️ Sleep War: The Weekend Offensive

> *Where productivity goes to die, and sleep becomes your most aggressive enemy*

**Sleep War** — an  over-engineered solution to a simple problem.

Armed with AWS Lambda, EventBridge, SNS, DynamoDB, Terraform, and a GitHub Actions pipeline that's probably overkill for what it does, we present to you: **a $0.03/month notification that says "GO TO BED" every 30 minutes starting at 21:30.**

## 🎖️ The Mission Brief

> "Go to bed, you absolute maniac. It's been 30 minutes."

## 🛠️ The Arsenal

| Weapon | Purpose | Overkill Level |
|--------|---------|----------------|
| **AWS Lambda** | Sends one simple message | 🟥🟥🟥 |
| **EventBridge Scheduler** | Triggers the Lambda every 30 min | 🟥🟥🟥🟥 |
| **SNS Topic** | Delivers notifications | 🟥🟥 |
| **DynamoDB** | Tracks when you *should* be sleeping | 🟥🟥🟥🟥🟥 |
| **CloudWatch Dashboard** | Visualizes your failure to sleep | 🟥🟥🟥 |
| **S3 + DynamoDB Locks** | Manages Terraform state like it's nuclear codes | 🟥🟥🟥🟥🟥 |
| **GitHub Actions** | Automatically deploys your shame | 🟥🟥🟥 |

## 📋 The Battle Plan

```
You at 21:30: "I'll just do one more thing..."
    ↓
21:30 - Notification (ignored)
    ↓
22:00 - Notification (definitely ignored)
    ↓
23:30 - Notification (why are we like this)
    ↓
02:47 - Notification (finally read by sleepwalking you)
    ↓
DynamoDB: *silently judges you*
```

## 🚀 Deployment

### Prerequisites
- AWS Account (and good health insurance for the guilt)
- Terraform 1.8.5+


### Step 1: Clone
```bash
git clone <repo-url>
cd overengineered-weekend
```

### Step 2: Initialize
```bash
cd infra
terraform init -backend-config="key=sleep-war/prod/terraform.tfstate"
```

### Step 3: Plan (and weep at the resource count)
```bash
terraform plan -var-file=../environments/prod.tfvars
```

### Step 4: Deploy Your Shame
```bash
terraform apply -var-file=../environments/prod.tfvars
```

## 📁 Project Structure

```
overengineered-weekend/
├── .github/workflows/
│   └── terraform.yml          ← The automated chaos enabler
├── environments/
│   ├── dev.tfvars             ← Practice ground
│   └── prod.tfvars            ← The real deal
├── infra/
│   ├── backend.tf             ← State management (very important)
│   ├── terraform.tf           ← Provider config
│   ├── variables.tf           ← Input definitions
│   ├── outputs.tf             ← What you get back
│   ├── dynamodb.tf            ← Sleep event history (judge-y database)
│   ├── lambda-function.tf     ← The nag
│   ├── sns-topic.tf           ← The messenger
│   ├── eventbridge-scheduler.tf ← The relentless alarm
│   ├── cloudwatch-dashboard.tf ← Your failure, visualized
│   └── ssm-parameter.tf       ← Configuration
├── modules/
│   ├── dynamodb/
│   ├── lambda-function/
│   ├── sns-topic/
│   ├── eventbridge-scheduler/
│   ├── cloudwatch-dashboard/
│   └── ssm-parameter/
└── README.md                  ← You are here
```

## 🔄 CI/CD Pipeline (The Enforcement Engine)

Every push to `main` will:
1. ✅ Check formatting
2. ✅ Validate Terraform
3. ✅ Create a plan
4. ✅ Auto-apply (no mercy)

**Branch Strategy**:
- `main` = prod environment (live firing)
- Feature branches = dev environment (practice)

## 📊 Monitoring

The CloudWatch Dashboard tracks:
- Lambda executions (how many times did it nag you?)
- Errors (when the nagging failed)
- Execution time (it's almost instant — because you can't escape it)

## 🔐 Security Notes

✅ S3 encryption enabled  
✅ DynamoDB locks prevent concurrent deployments  
✅ SNS is encrypted  
✅ All state files are protected  
✅ Lambda has minimal permissions (to minimize collateral damage)

## 💸 Cost Estimate

- DynamoDB: ~$0.01/month (free tier covers it)
- Lambda: ~$0.01/month (it's tiny and fast)
- EventBridge: ~$0.01/month (scheduler pricing is generous)
- SNS: Free (within limits)
- **Total**: ~$0.03/month to feel guilty about not sleeping

**Cost per sleep-skip**: $∞ (in health)

## 🎯 Pro Tips

1. **Use the CloudWatch dashboard**: Shame is a powerful motivator
2. **Set custom messages**: Make it personal ("You absolute donut")
3. **Monitor via SNS**: Subscribe your phone to get actual notifications

## 📝 Configuration

Edit `environments/prod.tfvars` to customize:
- Notification message
- Schedule timing (if 21:30 is too early for your chaos)
- SNS topic name
- Lambda timeout (though 30s is plenty)

## 📚 Tech Stack

- **IaC**: Terraform 1.8.5+
- **Cloud**: AWS (eu-west-1, Ireland)
- **CI/CD**: GitHub Actions
- **Serverless**: Lambda + EventBridge
- **State**: S3 + DynamoDB
- **Notifications**: SNS
- **Monitoring**: CloudWatch


## 📄 License

MIT License — Do whatever you want with this beautifully unnecessary code.

