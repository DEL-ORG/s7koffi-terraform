# creat an Ec2 instance
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  vpc_security_group_ids = [var.security_group.sg.id]

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}
