# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1" # Replace with your preferred default region
}

# IAM Group Name
variable "group_name" {
  description = "The name of the IAM group to be created"
  type        = string
  default     = "family-group"
}

# IAM User Name
variable "user_name" {
  description = "The name of the IAM user to be created"
  type        = string
  default     = "Mensah"
}

# Managed Policy ARN for Group
variable "group_policy_arn" {
  description = "The ARN of the managed policy to attach to the IAM group"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Replace with desired policy ARN
}

# Role Name
variable "role_name" {
  description = "The name of the IAM role to be created"
  type        = string
  default     = "family-group-role"
}

# Assume Role Policy Document
variable "assume_role_policy" {
  description = "The policy document that defines who can assume the IAM role"
  type        = string
  default     = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOT
}

# Custom Policy for Role
variable "role_policy" {
  description = "The custom policy for the IAM role"
  type        = string
  default     = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOT
}
