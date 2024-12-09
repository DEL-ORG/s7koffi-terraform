data "aws_vpc" "my_main_vpc" {
  filter {
    name   = "tag:name"
    values = ["var.default_vpc"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name   = "tag:name"
    values = ["var.default_sg"]
  }
}

data "aws_subnet" "sg" {
  filter {
    name   = "tag:name"
    values = ["var.default_subnet"]
  }
}


# data "aws_ami" "ubuntu_ami" {
#   most_recent = false

#   filter {
#     name   = "tag:name"
#     values = ["ubuntu1"]
#   }
# }

# data "aws_key_pair" "My-kay" {
#   filter {
#     name   = "name"
#     values = ["My-key"]
#   }
# }