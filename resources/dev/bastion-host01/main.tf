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
    key            = "bastion-host01/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "2024-dev-s7project-s7-tf-state-lock"
    encrypt        = true
  }
}


locals {
    aws_region                    = "us-east-1"
    ec2_instance_ami              = "ami-0866a3c8686eaeeba"
    ec2_instance_type             = "t2.micro"
    sg_name                       = "my-sg"
    instance_name                 = "my-bastion-host01"
    vpc_id                        = "vpc-05c4ec68dc86a1e2f"
    subnet_id                     = "subnet-03de39c16743cdbd2"
    root_volume_size              = 10
    instance_count                = 1
    enable_termination_protection = false
    ec2_instance_key_name         = "My-key"
    allowed_ports = [
    22,
    443,
    8080
    ]
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

module "bastion-host01" {
    source = "../../../modules/bastion-host01"
    aws_region                    = local.aws_region
    ec2_instance_ami              = local.ec2_instance_ami
    ec2_instance_type             = local.ec2_instance_type
    sg_name                       = local.sg_name
    instance_name                 = local.instance_name
    vpc_id                        = local.vpc_id
    subnet_id                     = local.subnet_id
    root_volume_size              = local.root_volume_size
    instance_count                = local.instance_count
    enable_termination_protection = local.enable_termination_protection
    ec2_instance_key_name         = local.ec2_instance_key_name
    tags                          = local.tags
}