resource "aws_key_pair" "thekeypair" {
  public_key = file("C:/Users/moazi/Documents/public.pub")
}

resource "aws_instance" "theinstance" {
  ami = "ami-0408adfcef670a71e"
  instance_type = "t3.micro"
  key_name = aws_key_pair.thekeypair.key_name
}