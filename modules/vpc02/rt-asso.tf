# Associate Public Subnets with the Public Route Table
resource "aws_route_table_association" "public_association" {
  count = 3

  subnet_id      = element(aws_subnet.my_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.my_public_rt.id
}

# Associate Private Subnets with the Private Route Table
resource "aws_route_table_association" "private_association" {
  count = 3

  subnet_id      = element(aws_subnet.my_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.my_private_rt.id
}

# Route for Private Subnets to route through the respective NAT Gateway for internet access
resource "aws_route" "private_nat_route" {
  count                  = 3
  route_table_id         = aws_route_table.my_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}