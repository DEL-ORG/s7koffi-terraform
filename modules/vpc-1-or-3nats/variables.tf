# # Define the AWS region
# variable "aws_region" {
#   description = "AWS Region to deploy"
#   type        = string
#   #   default     = "us-east-1" # Change to your preferred region
# }

# # Define the VPC CIDR block
# variable "cidr_block" {
#   description = "The CIDR block for the VPC"
#   type        = string
#   #   default     = "10.0.0.0/16"
# }

# # Define the availability zones to use for the subnets
# variable "availability_zones" {
#   description = "List of Availability Zones"
#   type        = list(string)
#   #   default     = ["us-east-1a", "us-east-1b", "us-east-1c"] # Modify based on your region
# }

# # Define tags for the resources
# variable "common_tags" {
#   description = "A map of tags to be applied to all resources"
#   type        = map(string)
#   default = {
#     id             = "2024"
#     owner          = "s7koffi"
#     environment    = "prod"
#     project        = "vpc-project"
#     create_by      = "Terraform"
#     cloud_provider = "aws"
#   }
# }


variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
variable "tags" {
  description = "A map of tags for all resources"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}






# # Define the cluster name for Kubernetes
# variable "cluster_name" {
#   description = "The name of the Kubernetes cluster"
#   type        = string
#   default     = "my-cluster"
# }
