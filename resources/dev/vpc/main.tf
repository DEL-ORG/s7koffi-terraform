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
  aws_region           = "us-east-1"
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  availability_zone    = "us-east-1a"
  nat_gateway_eip_name = "NAT-EIP"

  tags = {
    "id"             = "2024"
    "owner"          = "koffimensah"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "archanciel"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "vpc" {
  source               = "../../../modules/vpc"
  vpc_cidr_block       = local.vpc_cidr_block
  public_subnet_cidr   = local.public_subnet_cidr
  private_subnet_cidr  = local.private_subnet_cidr
  availability_zone    = local.availability_zone
  nat_gateway_eip_name = local.nat_gateway_eip_name
  tags                 = local.tags
}

