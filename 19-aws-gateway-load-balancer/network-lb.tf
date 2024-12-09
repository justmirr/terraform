resource "aws_lb" "theloadbalancer" {
    name = "happy-gateway-lb" 
    load_balancer_type = "gateway"
    subnets = [ aws_subnet.thepublicsubnet1.id, aws_subnet.thepublicsubnet2.id ]
}

resource "aws_lb_target_group" "thetargetgroup" {
    name = "happy-target-group"
    port = 6081
    protocol = "GENEVE"
    vpc_id = aws_vpc.thevpc.id
}

resource "aws_lb_target_group_attachment" "thetargetgroupattachment" {
    target_group_arn = aws_lb_target_group.thetargetgroup.arn
    target_id = aws_instance.theinstance.id
    port = 6081
}

resource "aws_instance" "theinstance" {
  instance_type = "t2.micro"
  tags = {
    Name = "happy-instance"
  }
  subnet_id = aws_subnet.thepublicsubnet1.id
  ami                    = "ami-0408adfcef670a71e"
  key_name               = aws_key_pair.thekeypair.key_name
}