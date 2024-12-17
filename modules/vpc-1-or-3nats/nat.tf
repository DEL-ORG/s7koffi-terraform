
# resource "aws_nat_gateway" "nat" {
#   count = format("%st", var.common_tags["environment"]) == "prod" ? 3 : 1 # create 3 Nats for production, 1 for other environments

#   allocation_id = aws_eip.nat[count.index].id
#   subnet_id     = element(aws_subnet.my_public_subnet.*.id, count.index)


#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-nat", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
#     },
#   )
# }


# creat NAT Gateway
resource "aws_nat_gateway" "nat" {
  count = format("%s", var.tags["environment"]) == "prod" ? length(var.availability_zones) : 1  # create 3 Nats for production, 1 for other environments
 
  allocation_id = aws_eip.nat[count.index].id   # use the EIP for the NAT Gateway
  subnet_id     = aws_subnet.my_public_subnet[count.index % length(aws_subnet.my_public_subnet)].id # Distribute NAT Gateway accross available public subnets


  tags = {
    Name = format("%s-nat_gateway", count.index)
    }
}
