variable "aws_region_main" {
  type    = string
  default = "us-east-1"
}

variable "aws_region_backup" {
  type    = string
  default = "us-east-2"
}

variable "replication_role_arn" {
  description = "The ARN of the IAM role used for S3 bucket replication."
  type        = string
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
