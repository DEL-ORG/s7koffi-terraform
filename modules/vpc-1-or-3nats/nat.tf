
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
  count = var.tags["environment"] == "prod" ? length(var.availability_zones) : 1 # 3 NATs for prod, 1 for other environments

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = values(aws_subnet.my_public_subnet)[count.index % length(values(aws_subnet.my_public_subnet))].id

  tags = {
    Name = format("%s-nat_gateway-%d", var.tags["environment"], count.index + 1)
  }
}
