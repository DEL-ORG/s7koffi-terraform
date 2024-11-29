# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = merge(var.tags, {
    Name = format("%s-%s-public_subnet", var.tags["project"], var.tags["environment"])
    },
  )
}
