# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Security Group for Bastion Host"
  vpc_id      = var.vpc_id
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion_sg", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )

  ingress {
    description = "Allow SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}