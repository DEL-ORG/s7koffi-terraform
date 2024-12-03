# Bastion Host Instance
resource "aws_instance" "bastion_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  security_groups             = [aws_security_group.bastion_sg.id]

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion_host", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )
}