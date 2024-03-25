resource "aws_lb_target_group" "tg-group" {
    name = "servertargetgroup"
    protocol = var.protocol_for_tg
    port = var.port_for_tg
    vpc_id = aws_vpc.vpc.id
}