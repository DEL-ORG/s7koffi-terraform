packer {
  required_version = ">= 1.8.5"
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  region        = "us-east-1"
  instance_type = "t2.micro"
  # source_ami    = "ami-0c02fb55956c7d316"
  ami_name = "packer-jenkins-{{timestamp}}"

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

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240927"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  tags = {
    "name"           = "ubuntu-apache-ami"
    "id"             = "2024"
    "owner"          = "s7koffimensah"
    "environment"    = "dev"
    "project"        = "my-project"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

build {
  name    = "jenkins-packages"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "file" {
    source      = "./install-jenkins-server.sh"
    destination = "/tmp/install-jenkins-server.sh"
  }

  provisioner "shell" {
    inline = [
      "sudo chmod +x /tmp/install-jenkins-server.sh",
      "sudo bash /tmp/install-jenkins-server.sh"
    ]
  }
}
