# Create an Ec2 instance
resource "aws_instance" "myec2vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.example.id]
  #tags                   = var.common_tags
  
  
}