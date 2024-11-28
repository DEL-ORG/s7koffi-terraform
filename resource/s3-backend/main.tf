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
  alias  = "state"
  region = local.aws_region_main
}

provider "aws" {
  alias  = "backup"
  region = local.aws_region_backup
}

locals {
  aws_region_main   = "us-east-1"
  aws_region_backup = "us-east-2"
  common_tags = {
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "s3-backend" {
  source            = "../../module/s3-backend"
  aws_region_main   = local.aws_region_main
  aws_region_backup = local.aws_region_backup
  common_tags       = local.common_tags
}
