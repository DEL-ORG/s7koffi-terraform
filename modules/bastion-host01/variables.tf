# Define string variables
variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "ec2_instance_ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0866a3c8686eaeeba"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-05c4ec68dc86a1e2f"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
  default     = "subnet-03de39c16743cdbd2"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume for the EC2 instance"
  default     = 10
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_name" {
  type    = string
  default = "my-bastion-host01"
}

variable "sg_name" {
  type    = string
  default = "my-sg"
}

variable "ec2_instance_key_name" {
  type    = string
  default = "My-key"
}

variable "enable_termination_protection" {
  type    = bool
  default = false
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
  default = [
    22,
    443,
    8080
  ]
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2024"
    "owner"          = "s7koffi"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "s7terraform"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}