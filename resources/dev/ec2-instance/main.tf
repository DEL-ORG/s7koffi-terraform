# Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider bock
provider "aws" {
  region = local.aws_region
}

locals {
  aws_region         = "us-east-1"
  instance_type      = "t2.micro"
  ami_id             = "ami-0866a3c8686eaeeba"  # Replace with a valid AMI ID for your region
  key_name           = "my-key"                 # Replace with your key pair name
  security_group_ids = ["sg-0a123456b789cdef0"] # Replace with your security group ID

  common_tags = {
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "ec2-instance" {
  source             = "../../../modules/ec2-instance"
  aws_region         = local.aws_region
  instance_type      = local.instance_type
  ami_id             = local.ami_id
  key_name           = local.key_name
  security_group_ids = local.security_group_ids
  common_tags        = local.common_tags
}