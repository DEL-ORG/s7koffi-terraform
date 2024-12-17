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
  region = var.aws_region
}

# Get the availability zones in the region
data "aws_availability_zones" "available" {
  state = "available"
}