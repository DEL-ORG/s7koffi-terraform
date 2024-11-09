# creat an Ec2 instance
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_group_ids

  tags = {
    Name = "my-new-instance"
  }
}
