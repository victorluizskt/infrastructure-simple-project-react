terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}

provider "aws" {
    profile = "default"
    region = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-006e00d6ac75d2ebb"
  instance_type = var.instance
  key_name = var.key
  tags = {
    Name = var.name_instance
  }
}

resource "aws_key_pair" "keySSH" {
    key_name = var.key
    public_key = file("${var.key}.pub")
}

output "public_ip" {
    value = aws_instance.app_server.public_ip
}