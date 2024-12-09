data "aws_vpc" "my_main_vpc" {
    filter {
      name = "tag:name"
      values = ["default_vpc"]
    }        
}

data "aws_security_group" "sg" {
    filter {
      name = "tag:name"
      values = ["default_sg"]
    }        
}

data "aws_subnet" "my-subnet" {
    filter {
      name = "tag:name"
      values = ["default_sg"]
    }        
}



# data "aws_ami" "ubuntu_ami" {
#     most_recent = false

#     filter {
#       name = "name"
#       values = ["default_ami"]
#     }        
# }

data "aws_key_pair" "My-kay" {
    filter {
      name = "name"
      values = ["key_pair"]
    }        
}