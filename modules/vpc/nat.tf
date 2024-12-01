# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  
  tags = merge(var.tags, {
    Name = format("%s-%s-nat_gateway", var.tags["project"], var.tags["environment"])
    },
  )
}
