variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "vpc Id for the EC2 instance"
  type        = string
}

variable "aws_security_group_ids" {
  description = "Security group IDs to attach to the instance"
  type        = list(string)
}
variable "common_tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default = {
    id             = "2024"
    owner          = "s7koffimensah"
    environment    = "dev"
    project        = "my-project"
    create_by      = "Terraform"
    cloud_provider = "aws"

  }
}