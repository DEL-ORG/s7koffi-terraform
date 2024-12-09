terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

# Terraform s3 backend
terraform {
    backend "s3" {
    bucket         = "2024-dev-my-project-s7-tf-state"           
    key            = "vpc02/terraform.tfstate" 
    region         = "us-east-1"                                 
    dynamodb_table = "2024-dev-my-project-s7-tf-state-lock"  
    encrypt        = true    
  }
}
locals {
  aws_region = "us-east-1"
  cidr_block = "10.0.0.0/16"
  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
  common_tags = {
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "vpc02" {
  source             = "../../../modules/vpc02"
  aws_region         = local.aws_region
  cidr_block         = local.cidr_block
  availability_zones = local.availability_zones
  common_tags        = local.common_tags

}
