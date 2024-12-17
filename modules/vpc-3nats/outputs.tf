# output "vpc_id" {
#     value = aws_vpc.my_main_vpc.id
# }

# output "public_subnets" {
#     value = [for subnet in aws_subnet.my_public_subnet : subnet.id]
# }

# output "private_subnets" {
#     value = [for subnet in aws_subnet.my_private_subnet : subnet.id]
# }

# output "nat_gateway_ids" {
#     value = [for nat in aws_nat_gateway.nat : nat.id]
# }