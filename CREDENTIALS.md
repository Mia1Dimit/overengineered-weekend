# 🔐 AWS Credentials Setup for GitHub Actions

This document explains how to properly inject AWS credentials into your GitHub Actions pipeline.

## 🚨 The Error You're Getting

```
Error: No valid credential sources found
Error: failed to refresh cached credentials, no EC2 IMDS role found
```

**Cause**: AWS credentials are not being passed to the GitHub Actions runner.

---

## ✅ Solution: GitHub Secrets (Recommended for Dev/Staging)

### Step 1: Create AWS IAM User (or use existing credentials)

You need AWS credentials with permissions to:
- Create/read S3 buckets (for state)
- Create/read DynamoDB tables (for locks)
- Deploy to your selected services (Lambda, EventBridge, SNS, DynamoDB, etc.)

**Minimum IAM Policy** (for testing):
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*",
        "dynamodb:*",
        "lambda:*",
        "events:*",
        "sns:*",
        "cloudwatch:*",
        "ssm:*",
        "iam:*",
        "logs:*"
      ],
      "Resource": "*"
    }
  ]
}
```

### Step 2: Add Secrets to GitHub

1. Go to your GitHub repo
2. **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**

Add TWO secrets:

#### Secret 1: AWS_ACCESS_KEY_ID
```
Name: AWS_ACCESS_KEY_ID
Value: AKIA1234567890ABCDEF  (your AWS access key)
```

#### Secret 2: AWS_SECRET_ACCESS_KEY
```
Name: AWS_SECRET_ACCESS_KEY
Value: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY  (your AWS secret key)
```

### Step 3: Verify in GitHub Actions

The workflow now validates:
```yaml
- name: Verify AWS Credentials
  run: |
    if [ -z "${{ secrets.AWS_ACCESS_KEY_ID }}" ]; then
      echo "❌ ERROR: AWS_ACCESS_KEY_ID secret is not set!"
      exit 1
    fi
    echo "✅ AWS credentials are configured"
```

---

## 🏆 Best Practice: Use AWS STS AssumeRole (Production)

For **production**, use OpenID Connect (OIDC) instead of long-lived credentials:

### Benefits:
- ✅ No long-lived credentials in GitHub
- ✅ Each workflow run gets temporary credentials (1 hour)
- ✅ Audit trail in AWS CloudTrail
- ✅ Fine-grained permissions per workflow

### Setup (Advanced):

1. **Create IAM OIDC Provider in AWS**:
```bash
aws iam create-openid-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --client-id-list sts.amazonaws.com \
  --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1
```

2. **Create IAM Role for GitHub Actions**:
```bash
aws iam create-role \
  --role-name github-actions-role \
  --assume-role-policy-document file://trust-policy.json
```

**trust-policy.json**:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::ACCOUNT_ID:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:YOUR_USERNAME/overengineered-weekend:*"
        }
      }
    }
  ]
}
```

3. **Update workflow to use OIDC**:
```yaml
permissions:
  contents: read
  id-token: write  # Required for OIDC

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Assume AWS Role
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: arn:aws:iam::ACCOUNT_ID:role/github-actions-role
          aws-region: eu-west-1
```

---

## 🔍 Troubleshooting

### Check 1: Are Secrets Set?
Go to: **Settings** → **Secrets and variables** → **Actions**
- ✅ Do you see `AWS_ACCESS_KEY_ID`?
- ✅ Do you see `AWS_SECRET_ACCESS_KEY`?

### Check 2: Are Credentials Valid?
Test locally:
```bash
export AWS_ACCESS_KEY_ID="your_key_id"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
aws sts get-caller-identity

# Should output:
# {
#   "UserId": "AIDAJ45Q7YFFAREXAMPLE",
#   "Account": "123456789012",
#   "Arn": "arn:aws:iam::123456789012:user/your-user"
# }
```

### Check 3: S3 & DynamoDB Exist?
```bash
# Check S3 bucket
aws s3 ls s3://tfstates-577638377042-eu-west-1-an

# Check DynamoDB table
aws dynamodb list-tables --region eu-west-1 | grep tfstates
```

### Check 4: GitHub Actions Logs
1. Go to **Actions** tab
2. Click the failed workflow
3. Expand **Verify AWS Credentials** step
4. If it says "secret is not set" → Go to Step 2 above

---

## 📝 Security Best Practices

### ✅ DO:
- ✅ Use separate AWS accounts for dev/staging/prod
- ✅ Use least-privilege IAM policies
- ✅ Rotate credentials regularly
- ✅ Use OIDC for production
- ✅ Enable MFA on AWS accounts
- ✅ Monitor CloudTrail for unusual activity

### ❌ DON'T:
- ❌ Commit credentials to Git (GitHub will scan and warn)
- ❌ Use root AWS account credentials
- ❌ Share AWS credentials between projects
- ❌ Store credentials in plaintext
- ❌ Use long-lived credentials for production

---

## 🚀 Workflow Execution Order

```
1. Verify Credentials Set ✓
    ↓
2. Checkout Code
    ↓
3. Setup Terraform
    ↓
4. Determine Environment (dev/prod)
    ↓
5. Terraform Init (with backend-config)
    ↓
6. Format Check
    ↓
7. Validate Syntax
    ↓
8. Plan Changes
    ↓
9. Post Plan to PR (if PR)
    ↓
10. Apply (if main branch)
```

---

## 🎯 Next Steps

1. **Add Secrets** (Settings → Secrets → Actions)
2. **Trigger Workflow** (Push to GitHub)
3. **Check Logs** (Actions → View Logs)
4. **Verify Plan** (Plan shows expected changes)

---

## 📚 Further Reading

- [GitHub Actions Secrets Docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [AWS STS AssumeRole](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html)
- [GitHub OIDC Provider](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect)
- [Terraform AWS Provider Auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication)

---

**TL;DR**: Add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` to GitHub Secrets. Done. 🎖️
