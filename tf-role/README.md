# Terraform Execution Role Module

This Terraform module provides infrastructure as code (IaC) to create an IAM Role across the entire AWS Organization using a CloudFormation stackset.
Such IAM role will be set to be assumed by any entity from a specific AWS account, ideally your service account.

## Prerequisites

Before using this Terraform TF-ROLE module, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/) installed on your machine.
- Set variables and backend values in the proper TF files.
- AWS credentials configured on your machine with appropriate permissions.

## Usage

1. Clone this repository
2. Navigate to the `tf-role` Module Directory to set up the CFN stackset.
3. Update `variables.tf`, `versions.tf` files and review `template/iam-role.yaml.tftpl` file.
4. **Initialize** the Terraform Configuration:

    ```bash
    terraform init
    ```

5. **Preview** the Changes:

    ```bash
    terraform plan
    ```

6. **Apply** the Changes:

    ```bash
    terraform apply
    ```

    Confirm by entering `yes` when prompted.

7. **After the Deployment:**
    After the deployment is complete, Terraform will output the details of the created TF-ROLE details.

## Cleanup

To destroy the created CFN Stackset and associated resources, run:

```bash
terraform destroy
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack_set.cfn_stackset](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set) | resource |
| [aws_cloudformation_stack_set_instance.cfn_stackset_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set_instance) | resource |
| [local_file.cfn_template](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Organization root account ID. | `string` | `"123456789012"` | no |
| <a name="input_assume_role_name"></a> [assume\_role\_name](#input\_assume\_role\_name) | AWS IAM Service Role to create/update AWS resources at the AWS Organization root account. | `string` | `"OrganizationAccountIamServiceRole"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"ap-southeast-2"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | IAM Service Role name to be deployed at each AWS account in the Organization. | `string` | `"ReadOnlyAccessIamServiceRole"` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | Service account ID of AWS account that will be use to invoke the IAM Service Role | `string` | `"123456789012"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS resources tags | `any` | <pre>{<br>  "CreatedBy": "YOUR_NAME",<br>  "Terraform": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | n/a |
| <a name="output_root_account_id"></a> [root\_account\_id](#output\_root\_account\_id) | n/a |
| <a name="output_root_organization_id"></a> [root\_organization\_id](#output\_root\_organization\_id) | n/a |
| <a name="output_stack_arn"></a> [stack\_arn](#output\_stack\_arn) | n/a |
<!-- END_TF_DOCS -->
