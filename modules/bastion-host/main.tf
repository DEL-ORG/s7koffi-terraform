# Bastion Host Instance
resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.subnet_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  security_groups             = [data.aws_security_group.sg.id]

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true

  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion-host", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}