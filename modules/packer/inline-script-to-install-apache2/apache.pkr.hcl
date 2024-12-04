source "amazon-ebs" "ubuntu_apache" {
  region        = "us-east-1"
  instance_type = "t2.micro"
  source_ami    = "ami-0c02fb55956c7d316"
  ami_name      = "packer-apache2-{{timestamp}}"

  vpc_id             = "vpc-05c4ec68dc86a1e2f"
  subnet_id          = "subnet-03de39c16743cdbd2"
  security_group_ids = ["sg-01a2702c499c3c72a"]

  ssh_username                = "ubuntu"
  ssh_port                    = "22"
  associate_public_ip_address = true

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
    volume_type = "gp2"
  }
}

 common_tags = {
    "id"             = "2024"
    "name"           = "ubuntu-apache-ami"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
}


build {
  name    = "apache-packages"
  sources = ["source.amazon-ebs.ubuntu_apache"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt install -y vim",
      "sudo apt install -y wget",
      "sudo apt install -y unzip",
      "sudo apt-get install apache2 -y",
      "sudo systemctl status apache2",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
    ]
  }
}