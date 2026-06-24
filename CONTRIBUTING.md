# 🎖️ Contributing to Sleep War

## 🔀 Branch Strategy

```
main (prod) ← Only verified, tested code lives here
  ↑
  └── feature/your-feature (dev) ← Your chaos testing ground
```

### Branch Naming Convention

- `feature/` - New features (e.g., `feature/more-aggressive-messages`)
- `fix/` - Bug fixes (e.g., `fix/lambda-actually-sending`)
- `docs/` - Documentation changes
- `ci/` - CI/CD pipeline improvements

## 📝 Commit Strategy (Very Important!)

**Each commit should be atomic and logical.** Make smaller commits that tell a story:

❌ BAD:
```
git commit -m "fixed stuff"
```

✅ GOOD:
```
git commit -m "feat: add custom notification messages via SSM Parameter"
git commit -m "docs: update schedule examples in README"
git commit -m "ci: fix GitHub Actions branch detection"
```

### Commit Message Format

Use conventional commits:
```
<type>: <subject>

<body>

<footer>
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `ci`: CI/CD changes
- `refactor`: Code refactoring
- `test`: Tests
- `chore`: Dependencies, version bumps

### Examples

```
feat: increase notification frequency to every 15 minutes

Users requested more aggressive bedtime reminders.
Adjusted EventBridge schedule and updated tests accordingly.

Closes #42
```

```
fix: SNS topic not receiving all notifications

DynamoDB was filtering out duplicate timestamps. Changed
hash key to include microseconds for uniqueness.
```

## 🚀 Workflow

### Step 1: Create Your Feature Branch
```bash
git checkout -b feature/your-awesome-feature
```

### Step 2: Make Changes & Commit (Multiple Small Commits!)
```bash
# Make a change
git add <file>
git commit -m "feat: first part of feature"

# Make another change
git add <file>
git commit -m "feat: second part of feature"

# Update docs
git add README.md
git commit -m "docs: update documentation"
```

### Step 3: Test Locally
```bash
cd infra
terraform init -backend-config="key=overengineered-weekend/dev/terraform.tfstate"
terraform plan -var-file=../environments/dev.tfvars
terraform validate
terraform fmt -check
```

### Step 4: Push & Create PR
```bash
git push origin feature/your-awesome-feature
```

Then create a Pull Request on GitHub with:
- Clear description of changes
- Why you're making the change
- Testing you've done

### Step 5: CI/CD Will Run
- ✅ Terraform format check
- ✅ Terraform validation
- ✅ Plan generation (posted as comment)
- ⚠️ **DO NOT MERGE** until all checks pass

### Step 6: Merge & Deploy
Once approved:
```bash
# GitHub will auto-apply to dev environment
git merge
git push origin main
# GitHub Actions auto-applies to prod
```

## 🧪 Testing Checklist

Before pushing, verify:

- [ ] `terraform fmt -check` passes
- [ ] `terraform validate` passes
- [ ] `terraform plan` shows expected changes (no surprises!)
- [ ] All resource names follow naming convention
- [ ] Documentation updated if needed
- [ ] No sensitive data in commits
- [ ] Commit messages are descriptive

## 📋 Code Review Standards

### What Gets Reviewed
- Terraform syntax & best practices
- AWS resource configuration
- Security implications
- Cost impact
- Documentation clarity

### Red Flags
- ❌ Hardcoded values (use variables!)
- ❌ Skipping validation
- ❌ Resource name inconsistencies
- ❌ Missing tags
- ❌ Overly aggressive variable defaults

### Approval Criteria
- ✅ All tests pass
- ✅ Code follows conventions
- ✅ Documentation updated
- ✅ At least one review approval
- ✅ CI/CD green

## 🛡️ Deployment Safety

### You CANNOT directly push to `main`

1. **Create a feature branch**
2. **Make changes**
3. **Push to feature branch**
4. **Create a PR**
5. **Wait for CI/CD checks**
6. **Get approved by someone (anyone, really)**
7. **Merge to main** → Auto-deploys to prod

### Rollback Procedure

If something goes horribly wrong:
```bash
# Find the last good commit
git log --oneline

# Revert
git revert <commit-hash>
git push origin main

# GitHub Actions will auto-apply the revert
```

## 📊 What NOT To Do

- 🚫 Never commit `.tfstate` files
- 🚫 Never hardcode AWS account IDs
- 🚫 Never commit AWS credentials
- 🚫 Never skip `terraform validate`
- 🚫 Never push directly to `main` (GitHub blocks this anyway)
- 🚫 Never ignore the CI/CD pipeline

## 🎪 Having Fun

This project is meant to be ridiculous. Feel free to:
- Add funny error messages
- Create aggressive schedule options
- Add creative notification variations
- Make the CloudWatch dashboard more entertaining
- Write humorous code comments

But always maintain:
- ✅ Working infrastructure
- ✅ Proper variable organization
- ✅ Clear documentation
- ✅ Security best practices

## 🤝 Code Examples

### Adding a New Feature: Custom Bedtime Message

```bash
# Create branch
git checkout -b feature/custom-messages

# Edit variables.tf
# Add: custom_message variable

# Commit 1: Add variable definition
git commit -m "feat: add custom_message variable to SSM parameters"

# Edit environments/prod.tfvars
# Uncomment and customize: custom_message parameter

# Commit 2: Update production config
git commit -m "config: add custom bedtime message configuration"

# Edit ssm-parameter.tf
# Update to use the new variable

# Commit 3: Wire up parameter
git commit -m "feat: wire custom message to SSM parameter module"

# Test & push
git push origin feature/custom-messages

# Create PR on GitHub
```

## 🎓 Learning Resources

- [Terraform Best Practices](https://www.terraform.io/docs)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
