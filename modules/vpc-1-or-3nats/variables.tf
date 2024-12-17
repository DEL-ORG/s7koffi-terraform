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



# Define the AWS region
variable "aws_region" {
  description = "AWS Region to deploy"
  type        = string
  #   default     = "us-east-1" # Change to your preferred region
}

# Define public subnet
variable "public_subnet_cidrs" {
  description = "public subnet cidrs"
  type        = string
  #   default     = ""
}

# Define private subnet
variable "private_subnet_cidrs" {
  description = "private subnet cidrs"
  type        = string
  #   default     = ""
}

# Define the VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  #   default     = "10.0.0.0/16"
}

# Define the availability zones to use for the subnets
variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
  #   default     = ["us-east-1a", "us-east-1b", "us-east-1c"] # Modify based on your region
}

# Define tags for the resources
variable "tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default = {
    environment    = "prod"
    project        = "vpc-project"
    create_by      = "Terraform"
    cloud_provider = "aws"
  }
}






# # Define the cluster name for Kubernetes
# variable "cluster_name" {
#   description = "The name of the Kubernetes cluster"
#   type        = string
#   default     = "my-cluster"
# }
