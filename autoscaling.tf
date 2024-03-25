resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = [ aws_subnet.sub-priv-1.id , aws_subnet.sub-priv-2.id ]
  name = "serverasg"
  launch_template {
    id = aws_launch_template.lt.id
    version = "$Latest"
  }
  min_size = 1
  max_size = 2
  desired_capacity = 2
}
resource "aws_autoscaling_attachment" "asg-attch" {
  lb_target_group_arn = aws_lb_target_group.tg-group.arn
  autoscaling_group_name = aws_autoscaling_group.asg.name
}