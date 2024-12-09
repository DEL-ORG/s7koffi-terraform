## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  alias  = "source"
  region = local.aws_region_main
}
provider "aws" {
  alias  = "backup"
  region = local.aws_region_backup
}

# Backend Configuration
terraform {
  backend "s3" {
    bucket         = "2024-dev-s7project-s7-tf-state"
    key            = "s3-backend/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "2024-dev-s7project-s7-tf-state-lock"
    encrypt        = true
  }
}

locals {
  aws_region_main   = "us-east-1"
  aws_region_backup = "us-east-2"

  common_tags = {
    "id"             = "2024"
    "owner"          = "s7koffi"
    "environment"    = "dev"
    "project"        = "s7project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "DEL"
  }
}

module "s3-backend" {
  source            = "../../../modules/s3-backend"
  aws_region_main   = local.aws_region_main
  aws_region_backup = local.aws_region_backup
  common_tags       = local.common_tags
}