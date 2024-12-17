# Define the AWS region
variable "aws_region" {
  type        = string
}

# Define public subnet
variable "public_subnet_cidrs" {
  type        = list(string)
  
}

# Define private subnet
variable "private_subnet_cidrs" {
  type        = list(string)
  
}


# Define the VPC CIDR block
variable "cidr_block" {
  type        = string

}

# Define the availability zones to use for the subnets
variable "availability_zones" {
  type        = list(string)
  
}

# Define tags for the resources
variable "common_tags" {
  type        = map(string)
  default = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "vpc3nat-project"
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
