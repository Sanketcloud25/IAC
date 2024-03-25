resource "aws_lb" "lb" {
  name = "lbserver"
  internal = false
  subnet_mapping {
    subnet_id = aws_subnet.sub-pub-1.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.sub-pub-2.id
  }
  security_groups = [ aws_security_group.lb-secgrp.id ]
}
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  protocol = "HTTP"
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg-group.arn
  }
}
resource "aws_security_group" "lb-secgrp" {
    vpc_id = aws_vpc.vpc.id
    name = "load_balancer"
}
resource "aws_vpc_security_group_ingress_rule" "ing-rule-lb" {
  security_group_id = aws_security_group.lb-secgrp.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "egr-rule-lb" {
  security_group_id = aws_security_group.lb-secgrp.id
  ip_protocol = "all"
 # from_port = 0
  #to_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}
output "dns_lb" {
  value = aws_lb.lb.dns_name
}