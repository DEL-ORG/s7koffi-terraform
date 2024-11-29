# Create a Route Table for the private subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-private_rt", var.tags["project"], var.tags["environment"])
    },
  )
}