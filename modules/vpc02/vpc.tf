# Create a VPC
resource "aws_vpc" "my_main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_main_vpc", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}