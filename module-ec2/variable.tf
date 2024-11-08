# variables.tf
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair to access the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the instance"
  type        = list(string)
}
