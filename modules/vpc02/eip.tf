# Create NAT Gateway for Private Subnets to access the internet
resource "aws_eip" "nat" {
  count = 3

  vpc = true
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-nat", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}
