resource "aws_launch_template" "lt" {
  name = "server"
  image_id = var.image_id
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.sg-server.id ]
  instance_type = var.instance_type
  user_data = base64encode(file("C:\\Users\\sanke\\OneDrive\\Desktop\\Daily\\vpc2\\truck.sh"))
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
      delete_on_termination = "true"
      
    }
  }
}
resource "aws_security_group" "sg-server" {
  vpc_id = aws_vpc.vpc.id
  name = "server"
}
resource "aws_vpc_security_group_ingress_rule" "ing-rule" {
  security_group_id = aws_security_group.sg-server.id
  ip_protocol = "all"
  #from_port = 0
  #to_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "egr-rule" {
  security_group_id = aws_security_group.sg-server.id
  ip_protocol = "all"
  #from_port = 0
  #to_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}