# Create a Route Table for the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-public_rt", var.tags["project"], var.tags["environment"])
    },
  )
}