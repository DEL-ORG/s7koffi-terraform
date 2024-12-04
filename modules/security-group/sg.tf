resource "aws_security_group" "sg" {
  description = "Security Group for all traffic"
  vpc_id      = var.vpc_id
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-sg_name", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    },
  )

  ingress {
    description = "Allow SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}