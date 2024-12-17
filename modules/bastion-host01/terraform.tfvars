aws_region                    = "us-east-1"
ec2_instance_ami              = "ami-0866a3c8686eaeeba"
ec2_instance_type             = "t2.micro"
sg_name                       = "my-sg"
instance_name                 = "my-bastion-host01"
vpc_id                        = "vpc-05c4ec68dc86a1e2f"
subnet_id                     = "subnet-03de39c16743cdbd2"
root_volume_size              = 10
instance_count                = 1
enable_termination_protection = false
ec2_instance_key_name         = "My-key"
allowed_ports = [
  22,
  443,
  8080
]
tags = {
  "id"             = "2024"
  "owner"          = "s7koffi"
  "teams"          = "devops"
  "environment"    = "dev"
  "project"        = "s7terraform"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}