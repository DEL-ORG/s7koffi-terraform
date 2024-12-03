
variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "us-east-1"
}

variable "aws_instance" {
  type        = string
  description = "aws region"
  default     = "bastion-host"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  default     = "vpc-05c4ec68dc86a1e2f"
}

variable "aws_security_group" {
  type        = string
  description = "security group name"
  default     = "bastion_sg"
}

variable "public_subnet_id" {
  type        = string
  description = "The ID of the public subnet where the bastion host will be deployed"
  default     = "subnet-03de39c16743cdbd2"
}

variable "ami_id" {
  type        = string
  description = "The ID of the AMI to be used for the Bastion Host"
  default     = "ami-0866a3c8686eaeeba"
}

variable "key_name" {
  type        = string
  description = "The name of the SSH key pair for accessing the Bastion Host"
  default     = "My-key"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type for the Bastion Host"
  default     = "t2.micro"
}

variable "allowed_ssh_cidr" {
  description = "The CIDR range allowed to SSH into the Bastion Host"
  default     = "0.0.0.0/0"
}

variable "common_tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default = {
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
