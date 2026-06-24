## 🎯 Description

What does this PR do? (2-3 sentences)

## 🔧 Changes

- [ ] What did you change 1
- [ ] What did you change 2
- [ ] What did you change 3

## 🧪 Testing

How did you test this?

```bash
# Example commands you ran
cd infra
terraform plan -var-file=../environments/dev.tfvars
```

## 📋 Checklist

- [ ] Code follows Terraform best practices
- [ ] `terraform fmt -check` passes
- [ ] `terraform validate` passes
- [ ] `terraform plan` shows expected changes
- [ ] No sensitive data committed
- [ ] Documentation updated (if needed)
- [ ] Commit messages are clear & atomic

## 📸 Output

Paste the relevant `terraform plan` output here (if infrastructure changes):

```hcl
# Example output
...
```

## 🔍 Related Issues

Closes #<issue_number>

## ⚠️ Deployment Notes

Any special considerations?
- [ ] Requires manual approval
- [ ] Breaking change
- [ ] Database migration needed
- [ ] Requires AWS permissions change

---

**Remember**: One feature = multiple atomic commits = better git history = happier future-you at 2 AM debugging.
