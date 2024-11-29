# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = merge(var.tags, {
    Name = format("%s-%s-igw", var.tags["project"], var.tags["environment"])
    },
  )
}