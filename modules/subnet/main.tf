# Create the subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true # Set to true if you want instances to get public IPs

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-my-subnet", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}