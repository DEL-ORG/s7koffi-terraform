# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  
  tags = merge(var.tags, {
    Name = format("%s-%s-igw", var.tags["project"], var.tags["environment"])
    },
  )
}