variable "aws_region_main" {
  type    = string
  default = "us-east-1"
}

variable "aws_region_backup" {
  type    = string
  default = "us-east-2"
}

variable "common_tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
  default = {
    id             = "2024"
    owner          = "s7koffi"
    environment    = "dev"
    project        = "s7project"
    create_by      = "Terraform"
    cloud_provider = "aws"
  }
}
