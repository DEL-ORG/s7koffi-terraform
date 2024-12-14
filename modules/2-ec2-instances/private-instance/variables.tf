# Variable definitions

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID for my EC2 instance."
  type        = string
  # default     = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  description = "The instance type you will use for the EC2 instance."
  type        = string
  # default     = "t2.micro"
}

variable "root_volume_size" {
  description = "The instance type you will use for the EC2 instance."
  type        = string
  default     = "20"
}

# variable "key_name" {
#   description = "The key pair name for SSH access to the EC2 instance."
#   type        = string
#   sensitive   = true
#   default = b_host_sg
# }

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "The Name tag for the EC2 instance."
  type        = string
  # default     = "Private-EC2-Instance"
}

variable "availability_zone" {
  description = "The AWS availability zone to deploy the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "The name of the existing VPC"
  type        = string
  default     = "default_vpc"
}

variable "common_tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "rainbow"
    create_by      = "DevOps_Team"
    cloud_provider = "aws"
  }
}
