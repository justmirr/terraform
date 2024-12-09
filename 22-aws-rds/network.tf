resource "aws_vpc" "thevpc" {
  tags = {
    Name = "happy-vpc"
  }
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "thesecuritygroup" {
  name        = "thesecuritygroup"
  description = "allow ssh"
  vpc_id = aws_vpc.thevpc.id
  tags = {
    Name = "happy-security-group"
  }

  ingress {
    description = "db ingress"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
      
  egress {
    description = "all egress"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_subnet" "thesubnetone" {
  tags = {
    Name = "happy-subnet-one"
  }
  vpc_id = aws_vpc.thevpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "thesubnettwo" {
  tags = {
    Name = "happy-subnet-two"
  }
  vpc_id = aws_vpc.thevpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}
