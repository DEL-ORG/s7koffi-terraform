# Create an EC2 instance in the private subnet
resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.my_subnet.id
  # key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-Private-EC2-Instance", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}
