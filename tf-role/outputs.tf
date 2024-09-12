output "organization_id" {
  value = data.aws_organizations_organization.this.id
}

output "root_organization_id" {
  value = data.aws_organizations_organization.this.roots[0].id
}

output "root_account_id" {
  value = var.account_id
}

output "stack_arn" {
  value = aws_cloudformation_stack_set.cfn_stackset.arn
}
