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

resource "aws_subnet" "theprivatesubnet" {
  vpc_id     = aws_vpc.thevpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "happy-private"
  }
}

resource "aws_subnet" "thepublicsubnet" {
  vpc_id                  = aws_vpc.thevpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "happy-public"
  }
}

resource "aws_internet_gateway" "theinternetgateway" {
  vpc_id = aws_vpc.thevpc.id
  tags = {
    Name = "happy-internet"
  }
}

resource "aws_route_table" "theroutetable" {
  vpc_id = aws_vpc.thevpc.id
  tags = {
    Name = "happy-route-table"
  }
}

resource "aws_route_table_association" "theroutetableassociation" {
  route_table_id = aws_route_table.theroutetable.id
  subnet_id      = aws_subnet.thepublicsubnet.id
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

resource "aws_instance" "theprivatesinstance" {
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.theprivatesubnet.id
  tags = {
    Name = "happy-private-instance"
  }
  ami                    = "ami-0408adfcef670a71e"
  vpc_security_group_ids = [aws_security_group.thesecuritygroup.id]
  key_name               = aws_key_pair.thekeypair.key_name
}

resource "aws_instance" "thepublicinstance" {
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.thepublicsubnet.id
  tags = {
    Name = "happy-public-instance"
  }
  ami                    = "ami-0408adfcef670a71e"
  vpc_security_group_ids = [aws_security_group.thesecuritygroup.id]
  key_name               = aws_key_pair.thekeypair.key_name
}