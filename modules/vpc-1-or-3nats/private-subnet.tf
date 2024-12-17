# # Create 3 Private Subnets
# resource "aws_subnet" "my_private_subnet" {
#   count = 3

#   vpc_id            = aws_vpc.my_main_vpc.id
#   cidr_block        = cidrsubnet(aws_vpc.my_main_vpc.cidr_block, 8, count.index + 3) # Start from subnet 3
#   availability_zone = element(data.aws_availability_zones.available.names, count.index)

#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-my_private_subnet", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
#     },
#   )
# }

# create 3 private subnets
resource "aws_subnet" "my_private_subnet" {
  for_each = tomap({ for idx, cidr in var.private_subnet_cidrs : idx => cidr })

  vpc_id                  = aws_vpc.my_main_vpc.id
  cidr_block = each.value
  availability_zone       = element(var.availability_zones, each.key)
  map_public_ip_on_launch = false  # Private subnets should not map public IPs

  tags = {
    Name = format("%s-my_private_subnet-%d", var.tags["environment"], each.key + 1)
    }
}