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

terraform {
  backend "s3" {
    bucket         = "2024-dev-s7project-s7-tf-state"
    key            = "subnet/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "2024-dev-s7project-s7-tf-state-lock"
    encrypt        = true
  }
}


locals {
  aws_region        = "us-east-1"
  vpc_id            = "vpc-05c4ec68dc86a1e2f"
  subnet_cidr       = "172.31.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "id"             = "2024"
    "owner"          = "s7koffi"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "s7terraform"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "subnet" {
  source            = "../../../modules/subnet"
  aws_region        = local.aws_region
  vpc_id            = local.vpc_id
  subnet_cidr       = local.subnet_cidr
  availability_zone = local.availability_zone
  common_tags       = local.tags
}