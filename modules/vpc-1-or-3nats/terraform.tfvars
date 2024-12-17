# # AWS Region
# aws_region = "us-east-1"

# # CIDR Block for the VPC
# cidr_block = "10.0.0.0/16"

# # Availability Zones to use
# availability_zones = [
#   "us-east-1a",
#   "us-east-1b",
#   "us-east-1c"
# ]

# # Tags for resources (this is an example and you can change as per your requirements)
# common_tags = {
#   "id"             = "2024"
#   "owner"          = "s7koffi"
#   "environment"    = "prod"
#   "project"        = "vpc-project"
#   "create_by"      = "Terraform"
#   "cloud_provider" = "aws"
# }




aws_region          = "us-east-1"        # AWS Region
vpc_cidr            = "10.0.0.0/16"      # CIDR Block for the VPC
public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24",
]
private_subnet_cidrs = [
  "10.0.101.0/24",
  "10.0.102.0/24",
  "10.0.103.0/24",
]
availability_zones  = [          # Availability Zones to use
  "us-east-1a", 
  "us-east-1b", 
  "us-east-1c"
  ]

# Tags for resources (this is an example and you can change as per your requirements)
tags = {
  "environment" = "dev"
  "project"     = "vpc-project"
  "create_by"   = "Terraform"
  "cloud_provider" = "aws"
}









# # Cluster name for Kubernetes
# cluster_name = "dev-cluster"
