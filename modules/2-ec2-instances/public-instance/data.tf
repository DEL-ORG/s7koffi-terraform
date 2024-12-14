data "aws_subnet" "my_subnet" {
  filter {
    name   = "tag:Name"
    values = ["2024-dev-my-project-my-subnet"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["2024-dev-my-project-sg_name"]
  }
}
