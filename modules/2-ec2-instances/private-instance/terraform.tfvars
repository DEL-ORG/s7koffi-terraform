aws_region          = "us-east-1"
ami_id              = "ami-0866a3c8686eaeeba"
instance_type       = "t2.micro"
root_volume_size    = "20"
associate_public_ip = true
instance_name       = "Private-EC2-Instance"
availability_zone   = "us-east-1a"
vpc_name            = "default_vpc"
common_tags = {
  id                = "2024"
  owner             = "s7koffi"
  environment       = "dev"
  project           = "rainbow"
  create_by         = "DevOps_Team"
  cloud_provider    = "aws"
}
