variable "aws_region_main" {
  type = string
}

variable "aws_region_backup" {
  type = string
}

# variable "force_destroy" {
#   type = bool
# }

variable "common_tags" {
  description = "A map of tags to be applied to all resources"
  type        = map(string)
}
