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
  region = "us-east-1"
}

# # Terraform s3 backend
# terraform {
#     backend "s3" {
#     bucket         = "2024-dev-my-project-s7-tf-state"           
#     key            = "vpc-3nats/terraform.tfstate" 
#     region         = "us-east-1"                                 
#     dynamodb_table = "2024-dev-my-project-s7-tf-state-lock"  
#     encrypt        = true    
#   }
# }

module "vpc-3nats" {
  source     = "../../../modules/vpc-3nats"
  aws_region = "us-east-1"
  cidr_block = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]

  private_subnet_cidrs = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]

  common_tags = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "vpc3nat-project"
    create_by      = "Terraform"
    cloud_provider = "aws"
  }
}



