variable "aws_region" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
  default     = "us-east-1"
}

# Variables for customization
variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created"
  type        = string
  default     = "vpc-05c4ec68dc86a1e2f"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24" # Change as needed
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a" # Change as needed
}

variable "common_tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "my-project"
    create_by      = "Terraform"
    cloud_provider = "aws"

  }
}