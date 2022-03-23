resource "aws_vpc" "hsm_test_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name  = "HSM Test VPC"
    Owner = var.owner
  }
}

resource "aws_subnet" "hsm_subnet_1" {
  vpc_id     = aws_vpc.hsm_test_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name        = "HSM Test Subnet 1"
    hsm_enabled = true
  }
}

resource "aws_subnet" "hsm_subnet_2" {
  vpc_id     = aws_vpc.hsm_test_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name        = "HSM Test Subnet 2"
    hsm_enabled = true
  }
}

resource "aws_internet_gateway" "hsm_test_ig" {
  vpc_id = aws_vpc.hsm_test_vpc.id
  tags = {
    Name = "HSM Test IG"
  }
}

resource "aws_route_table" "hsm_test_rt" {
  vpc_id = aws_vpc.hsm_test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hsm_test_ig.id
  }

  tags = {
    Name = "HSM Test RT"
  }
}

resource "aws_route_table_association" "subnet_1_rt_assoc" {
  subnet_id      = aws_subnet.hsm_subnet_1.id
  route_table_id = aws_route_table.hsm_test_rt.id
}

resource "aws_route_table_association" "subnet_2_rt_assoc" {
  subnet_id      = aws_subnet.hsm_subnet_2.id
  route_table_id = aws_route_table.hsm_test_rt.id
}
