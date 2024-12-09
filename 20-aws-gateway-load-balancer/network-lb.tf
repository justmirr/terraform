resource "aws_lb" "theloadbalancer" {
    name = "happy-network-lb" 
    load_balancer_type = "network"
    security_groups = [ "${aws_security_group.thesecuritygroup.id}" ]
    subnets = [ aws_subnet.thepublicsubnet1.id, aws_subnet.thepublicsubnet2.id ]
}

resource "aws_lb_target_group" "thetargetgroup" {
    name = "happy-target-group"
    port = 80
    protocol = "TCP"
    vpc_id = aws_vpc.thevpc.id
}

resource "aws_lb_target_group_attachment" "thetargetgroupattachment" {
    target_group_arn = aws_lb_target_group.thetargetgroup.arn
    target_id = aws_instance.theinstance.id
    port = 80
}

resource "aws_lb_listener" "thelistener" {
  load_balancer_arn = aws_lb.theloadbalancer.arn
  port = 80
  protocol = "TCP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.thetargetgroup.arn
  }
}

resource "aws_instance" "theinstance" {
  instance_type = "t2.micro"
  tags = {
    Name = "happy-instance"
  }
  vpc_security_group_ids = [ aws_security_group.thesecuritygroup.id ]
  subnet_id = aws_subnet.thepublicsubnet1.id
  ami                    = "ami-0408adfcef670a71e"
  key_name               = aws_key_pair.thekeypair.key_name
}