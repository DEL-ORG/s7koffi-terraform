
variable "aws_region" {
  type        = string
  description = "aws region"
  default     = ""
}

variable "aws_instance" {
  type        = string
  description = "aws region"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  default     = ""
}

variable "aws_security_group" {
  type        = string
  description = "security group name"
  default     = ""
}

variable "public_subnet_id" {
  type        = string
  description = "The ID of the public subnet where the bastion host will be deployed"
  default     = ""
}

variable "ami_id" {
  type        = string
  description = "The ID of the AMI to be used for the Bastion Host"
  default     = ""
}

variable "volume_size" {
  type        = string
  description = ""
  default     = ""
}

variable "volume_type" {
  type        = string
  description = ""
  default     = ""
}
variable "key_name" {
  type        = string
  description = "The name of the SSH key pair for accessing the Bastion Host"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type for the Bastion Host"
  default     = ""
}

variable "allowed_ssh_cidr" {
  description = "The CIDR range allowed to SSH into the Bastion Host"
  default     = ""
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
