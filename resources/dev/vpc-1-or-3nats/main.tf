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
  region = "us-east-1"
}

# Get the availability zones in the region
data "aws_availability_zones" "available" {
  state = "available"
}

terraform {
  backend "s3" {
    bucket         = "dev-backend-project-s7k-tf-state"
    key            = "vpc-1-or3nats/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-backend-project-s7k-tf-state-lock"
    encrypt        = true
  }
}

module "vpc-1-or-3nats" {
  source     = "../../../modules/vpc-1-or-3nats"
  aws_region = "us-east-1"
  vpc_cidr   = "10.0.0.0/16"

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
    "us-east-1c"
  ]

  tags = {
    "environment"    = "dev"
    "project"        = "vpc-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}