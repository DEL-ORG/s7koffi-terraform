# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true
  tags = merge(var.tags, {
    Name = format("%s-%s-nat_eip", var.tags["project"], var.tags["environment"])
    },
  )
}