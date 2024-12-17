# Create a VPC
resource "aws_vpc" "my_main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-my_main_vpc", var.tags["environment"])
    }
}