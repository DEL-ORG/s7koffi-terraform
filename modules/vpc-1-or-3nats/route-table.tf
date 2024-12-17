# # Create a Route Table for Public Subnets
# resource "aws_route_table" "my_public_rt" {
#   vpc_id = aws_vpc.my_main_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my_igw.id
#   }

#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-my_public_rt", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
#     },
#   )
# }

# # Associate Public Subnets with the Public Route Table
# resource "aws_route_table_association" "public_association" {
#   count = 3

#   subnet_id      = element(aws_subnet.my_public_subnet.*.id, count.index)
#   route_table_id = aws_route_table.my_public_rt.id
# }


# # Create a Route Table for Private Subnets (No direct route to the internet)
# resource "aws_route_table" "my_private_rt" {
#   vpc_id = aws_vpc.my_main_vpc.id

#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-my_private_rt", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
#   })
# }

# # Associate Private Subnets with the Private Route Table
# resource "aws_route_table_association" "private_association" {
#   count = format("%st", var.common_tags["environment"]) == "prod" ? length(var.availability_zones) : 1

#   subnet_id      = element(aws_subnet.my_private_subnet.*.id, count.index)
#   route_table_id = aws_route_table.my_private_rt.id
# }


# # Route for Private Subnets to route through the respective NAT Gateway for internet access
# resource "aws_route" "private_nat_route" {
#   count = format("%st", var.common_tags["environment"]) == "prod" ? length(var.availability_zones) : 1

#   route_table_id         = aws_route_table.my_private_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat[count.index].id
# }




# Create a Route Table for Public Subnets
resource "aws_route_table" "my_public_rt" {
  for_each = aws_subnet.my_public_subnet # creating one rt for each public subnet
  vpc_id = aws_vpc.my_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = format("%s-my_public_rt", var.tags["environment"], each.key)
    }
}

# Associate Public Subnets with the Public Route Table
resource "aws_route_table_association" "public_association" {
   for_each = aws_subnet.my_public_subnet # Iterate over the public subnets
   
   subnet_id = each.value.id
   route_table_id = aws_route_table.my_public_rt[each.key].id # referencing the public rt for each subnet

}

# Create a Route Table for Private Subnets (No direct route to the internet)
resource "aws_route_table" "my_private_rt" {
  for_each = {
    for idx, subnet in aws_subnet.my_private_subnet     # creating one rt for each private subnet
  }
  vpc_id = aws_vpc.my_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = lookup(
      aws_nat_gateway.nat[*].id,
      var.tags["environment"] == "prod" ? length(var.availability_zones) : 1  
    )
  }

  tags = {
      Name = format("%s-my_private_rt", var.tags["environment"])
      }
}

# Associate Private Subnets with the Private Route Table
resource "aws_route_table_association" "private_association" {
  for_each = aws_subnet.my_private_subnet # Iterate over the public subnets
  subnet_id = each.value.id
  route_table_id = aws_route_table.my_private_rt[each.key].id # referencing the private rt for each subnet
}

