
resource "aws_nat_gateway" "nat" {
  count         = 3
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.my_public_subnet.*.id, count.index)


  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-nat", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}