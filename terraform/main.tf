terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

# Core VPC Network defined in core-network.tf

resource "aws_security_group" "hsm_client_sg" {
  name        = "Hsm Client SG"
  description = "Allow ec2 SSH/HSM traffic, HSM ingress rule added later by automation script."
  vpc_id      = aws_vpc.hsm_test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  tags = {
    Name              = "HSM Client SG"
    Owner             = var.owner
    py-automation-key = "hsm-client-sg"
  }
}

resource "aws_ssm_parameter" "hsm_vpc_id" {
  name  = "/hsm-automation/vpc-id"
  type  = "String"
  value = aws_vpc.hsm_test_vpc.id
}

resource "aws_network_interface" "ec2_net_interface" {
  subnet_id = aws_subnet.hsm_subnet_1.id

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "hsm_client_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = "#!/bin/bash\nyum update -y\n"

  network_interface {
    network_interface_id = aws_network_interface.ec2_net_interface.id
    device_index         = 0
  }

  tags = {
    Name  = "HSM Client Server 1"
    Owner = var.owner
  }
}