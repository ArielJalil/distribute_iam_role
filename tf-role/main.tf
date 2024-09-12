locals {
  cfn_template_path = "${path.module}/cfn/iam-role.yaml"
}

resource "local_file" "cfn_template" {
  content              = templatefile("${path.module}/template/iam-role.yaml.tftpl", { account_id = var.service_account_id })
  filename             = local.cfn_template_path
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "aws_cloudformation_stack_set" "cfn_stackset" {
  depends_on  = [local_file.cfn_template]
  name        = "read-only-service-role-stackset"
  description = "Deploy a read only IAM service role to be assumed by automated processes across the entire Organization."
  parameters = {
    RoleName = var.iam_role_name
  }
  template_body = file(local.cfn_template_path)
  capabilities  = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM"]

  permission_model = "SERVICE_MANAGED"

  auto_deployment {
    enabled                          = true
    retain_stacks_on_account_removal = false
  }

  operation_preferences {
    max_concurrent_count    = 100
    failure_tolerance_count = 5
  }

  # Workaround to mitigate a terraform bug
  # https://github.com/hashicorp/terraform-provider-aws/issues/23464
  lifecycle {
    ignore_changes = [
      administration_role_arn
    ]
  }
}

data "aws_organizations_organization" "this" {}

resource "aws_cloudformation_stack_set_instance" "cfn_stackset_instance" {
  for_each       = toset([var.aws_region])
  stack_set_name = aws_cloudformation_stack_set.cfn_stackset.id
  region         = each.key
  deployment_targets {
    organizational_unit_ids = [data.aws_organizations_organization.this.roots[0].id]
  }
}
