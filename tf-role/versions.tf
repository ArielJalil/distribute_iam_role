terraform {
  required_version = "1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }

  backend "s3" {
    bucket = "S3_BUCKET_NAME"                        # S3 Bucket name to store TF state file
    key    = "distribute_iam_role/terraform.tfstate" # Suggested object key
    region = "us-east-1"                             # Change this value to your preferred location
  }
}
