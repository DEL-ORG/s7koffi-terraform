# # Create NAT Gateway for Private Subnets to access the internet
# resource "aws_eip" "nat" {
#   count = format("%st", var.common_tags["environment"]) == "prod" ? length(var.availability_zones) : 1 # create 3 EIPs for production, 1 for other environments

#   vpc = true
#   tags = merge(var.common_tags, {
#     Name = format("%s-%s-%s-eip-nat", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
#     },
#   )
# }


# create Elastic IPs for NAT Gateways
resource "aws_eip" "nat" {
  count = format("%s", var.tags["environment"]) == "prod" ? length(var.availability_zones) : 1  # create 3 EIPs for production, 1 for other environments
  vpc = true
  
  tags = {
    Name = format("%s-eip-nat", count.index)
    }
}

