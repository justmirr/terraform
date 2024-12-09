resource "aws_vpc" "thevpc" {
  cidr_block         = "10.0.0.0/16"
  instance_tenancy   = "default"
  enable_dns_support = true
  tags = {
    Name = "happy-vpc"
  }
}

resource "aws_key_pair" "thekeypair" {
  public_key = file("C:/Users/moazi/Documents/public.pub")
  tags = {
    Name = "happy-key-pair"
  }
}

resource "aws_subnet" "thepublicsubnet1" {
  vpc_id                  = aws_vpc.thevpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "happy-public-1"
  }
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "thepublicsubnet2" {
  vpc_id                  = aws_vpc.thevpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "happy-public-2"
  }
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "theinternetgateway" {
  vpc_id = aws_vpc.thevpc.id
  tags = {
    Name = "happy-internet"
  }
}

resource "aws_security_group" "thesecuritygroup" {
  name        = "happy-security-group"
  description = "allow ssh"
  vpc_id = aws_vpc.thevpc.id

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306]
    iterator = port
    content {
      description = "dynamic ingress"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "dynamic egress"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}