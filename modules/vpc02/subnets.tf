# Create 3 Public Subnets
resource "aws_subnet" "my_public_subnet" {
  count = 3

  vpc_id                  = aws_vpc.my_main_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.my_main_vpc.cidr_block, 8, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_public_subnet", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}

# Create 3 Private Subnets
resource "aws_subnet" "my_private_subnet" {
  count = 3

  vpc_id            = aws_vpc.my_main_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.my_main_vpc.cidr_block, 8, count.index + 3) # Start from subnet 3
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my_private_subnet", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}