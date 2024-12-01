variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "cidr block for the vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}


variable "availability_zone" {
  description = "availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "nat_gateway_eip_name" {
  description = "The name tag for the NAT Gateway Elastic IP"
  type        = string
  default     = "NAT-EIP"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2024"
    "owner"          = "koffimensah"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "archanciel"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
