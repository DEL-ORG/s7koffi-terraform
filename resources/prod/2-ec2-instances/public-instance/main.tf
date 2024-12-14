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
  aws_region       = "us-east-1"
  ami_id           = "ami-0866a3c8686eaeeba"
  instance_type    = "t2.micro"
  root_volume_size = "20"
  # key_name          = "b_host_sg"
  associate_public_ip = true
  instance_name       = "Public-EC2-Instance"
  availability_zone   = "us-east-1a"
  vpc_name            = "default_vpc"
  common_tags = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "rainbow"
    create_by      = "DevOps_Team"
    cloud_provider = "aws"
  }

}

module "public_instance" {
  source           = "../../../../modules/2-ec2-instances/public-instance/"
  aws_region       = local.aws_region
  ami_id           = local.ami_id
  instance_type    = local.instance_type
  root_volume_size = local.root_volume_size
  # key_name          = local.key_name
  associate_public_ip = local.associate_public_ip
  instance_name       = local.instance_name
  availability_zone   = local.availability_zone
  vpc_name            = local.vpc_name
  common_tags         = local.common_tags
}