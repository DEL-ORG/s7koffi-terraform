# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_main_vpc.id

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_igw", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}