# Create a Route Table for Public Subnets
resource "aws_route_table" "my_public_rt" {
  vpc_id = aws_vpc.my_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_public_rt", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}

# Create a Route Table for Private Subnets (No direct route to the internet)
resource "aws_route_table" "my_private_rt" {
  vpc_id = aws_vpc.my_main_vpc.id

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_private_rt", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}