aws_region          = "us-east-1"
ami_id              = "ami-0866a3c8686eaeeba"
instance_type       = "t2.micro"
root_volume_size    = "20"
# key_name            = "b_host_sg"
associate_public_ip = true
instance_name       = "Public-EC2-Instance"
availability_zone   = "us-east-1a"
vpc_name            = "default_vpc"
common_tags = {
  id             = "2024"
  owner          = "s7koffi"
  environment    = "dev"
  project        = "rainbow"
  create_by      = "DevOps_Team"
  cloud_provider = "aws"
}






# # Variable values
# aws_region          = "us-east-1"
# ami                 = "ami-0866a3c8686eaeeba"
# vpc_id              = "vpc-05c4ec68dc86a1e2f"
# security_group_id = "sg-0fe3edd49548d5354"
# public_subnet_id  = "subnet-0f246f61739f46cf8"

# private_subnet_id = "subnet-0af368151954a178c"
# key_name            = "bastion_host-key"
# public_key_path     = "~/.ssh/id_rsa.pub"
# instance_type       = "t2.micro"
# root_volume_size    = 10