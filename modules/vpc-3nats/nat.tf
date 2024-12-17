
resource "aws_nat_gateway" "nat" {
  count         = 3
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.my_public_subnet.*.id, count.index)


  tags = merge(var.common_tags, {
    Name = format("%s-%s-nat", var.common_tags["environment"], var.common_tags["project"])
    },
  )
}


# # creat NAT Gateway
# resource "aws_nat_gateway" "nat" {
#   for_each = aws_subnet.my_public_subnet  # one NAT Gateway per public subnet
#   allocation_id = aws_eip.nat[each.key].id   # use the EIP for the NAT Gateway
#   subnet_id     = each.value.id # Associate with the public subnet


#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-nat", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"], each.key)
#     },
#   )
# }
