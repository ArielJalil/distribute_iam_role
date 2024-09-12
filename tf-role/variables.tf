variable "account_id" {
  description = "AWS Organization root account ID."
  type        = string
  default     = "123456789012"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "assume_role_name" {
  description = "AWS IAM Service Role to create/update AWS resources at the AWS Organization root account."
  type        = string
  default     = "OrganizationAccountIamServiceRole"
}

variable "iam_role_name" {
  description = "IAM Service Role name to be deployed at each AWS account in the Organization."
  type        = string
  default     = "ReadOnlyAccessIamServiceRole"
}

variable "service_account_id" {
  description = "Service account ID of AWS account that will be use to invoke the IAM Service Role"
  type        = string
  default     = "123456789012"
}

variable "tags" {
  type        = any
  description = "AWS resources tags"
  default = {
    CreatedBy = "YOUR_NAME"
    Terraform = true
  }
}
