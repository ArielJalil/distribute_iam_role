# Distribute IAM role with an entire AWS Organization

This [Terraform](https://www.terraform.io/) module is inteded to deploy an AWS CloudFormation StackSet to deploy an IAM Role across an entire AWS Organization.

## Pre-requisites

* Terraform installed.
* An S3 bucket to store your Terraform state file if you want to use the TF module as it is.
* Administrative access to the root account of an AWS organization.

**Note:** Please check the `tf-role\README.md` file for deployment instructions.

## Consider to install pre-commit

If you are planning to enhance this code it is highly recommended to install [pre-commit](https://pre-commit.com/index.html)
 to speed up development and keep some standard coding style.

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)

## Author and Lincense

This code has been written by [Ariel Jall](https://github.com/ArielJalil) and it is released under
 [GNU 3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
