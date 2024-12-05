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
    bucket         = "dev-bastion-s7-tf-state"           
    key            = "bastion-host/terraform.tfstate" 
    region         = "us-east-1"                                 
    dynamodb_table = "dev-bastion-s7-tf-state-lock"  
    encrypt        = true    
  }
}


locals {
  aws_region         = "us-east-1"
  aws_instance       = "bastion-host"
  vpc_id             = "vpc-05c4ec68dc86a1e2f"
  aws_security_group = "bastion_sg"
  public_subnet_id   = "subnet-03de39c16743cdbd2"
  ami_id             = "ami-0866a3c8686eaeeba"
  key_name           = "My-key"
  instance_type      = "t2.micro"
  allowed_ssh_cidr   = "0.0.0.0/0"
  common_tags = {
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "bastion_host" {
  source             = "../../../modules/bastion-host"
  aws_region         = local.aws_region
  aws_instance       = local.aws_instance
  vpc_id             = local.vpc_id
  aws_security_group = local.aws_security_group
  public_subnet_id   = local.public_subnet_id
  ami_id             = local.ami_id
  key_name           = local.key_name
  instance_type      = local.instance_type
  allowed_ssh_cidr   = local.allowed_ssh_cidr
  common_tags        = local.common_tags

}