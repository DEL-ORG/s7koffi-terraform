# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = merge(var.tags, {
    Name = format("%s-%s-private_subnet", var.tags["project"], var.tags["environment"])
    },
  )
}