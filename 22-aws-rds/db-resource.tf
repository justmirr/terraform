resource "aws_db_subnet_group" "thedbsubnetgroup" {
  name = "thedbsubnetgroup"
  subnet_ids = [aws_subnet.thesubnetone.id, aws_subnet.thesubnettwo.id]
  tags = {
    Name = "happy-db-subnet-group"
  }
}

resource "aws_db_instance" "thedbinstance" {
  allocated_storage = 10 
  instance_class = "db.t3.micro"
  db_name = "happy"
  engine = "mysql"
  engine_version = "8.0"
  username = "mir"
  password = "password"
  vpc_security_group_ids = [aws_security_group.thesecuritygroup.id]
  db_subnet_group_name = aws_db_subnet_group.thedbsubnetgroup.name
  skip_final_snapshot = true
  tags = {
    Name = "happy-db-instance"
  }
}