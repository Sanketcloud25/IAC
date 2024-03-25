
cidr_block_for_vpc = "192.0.0.0/16"
cidr_block_for_sub_priv1 = "192.0.0.0/24"
cidr_block_for_sub_priv2 = "192.0.1.0/24"
cidr_block_for_sub_pub1 = "192.0.2.0/24"
cidr_block_for_sub_pub2 = "192.0.3.0/24"
destination_cidr_block = "0.0.0.0/0"
cidr_ipv4_sg = "0.0.0.0/0"
from_port_sg = 0
to_port_sg = 0
ip_protocol-sg = "all"
image_id =  "ami-019f9b3318b7155c5"
key_name = "ohio"
instance_type = "t2.micro"
volume_size = 8
volume_type = "gp2"
protocol_for_tg = "HTTP"
port_for_tg = 80