resource "aws_route_table" "rt-priv-1" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_route_table_association" "rt-sub-assoc-priv-1" {
  route_table_id = aws_route_table.rt-priv-1.id
  subnet_id = aws_subnet.sub-priv-1.id
}
resource "aws_route" "rt-assoc-priv-1" {
  route_table_id = aws_route_table.rt-priv-1.id
  nat_gateway_id = aws_nat_gateway.ngw-1.id
  destination_cidr_block = var.destination_cidr_block
}
resource "aws_route_table" "rt-priv-2" {
 vpc_id = aws_vpc.vpc.id
}
resource "aws_route_table_association" "rt-sub-assoc-priv-2" {
  route_table_id = aws_route_table.rt-priv-2.id
  subnet_id = aws_subnet.sub-priv-2.id
}
resource "aws_route" "rt-assoc-priv-2" {
  route_table_id = aws_route_table.rt-priv-2.id
  nat_gateway_id = aws_nat_gateway.ngw2.id
  destination_cidr_block = var.destination_cidr_block
}
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_route_table_association" "rt-subnet-pub" {
  route_table_id = aws_route_table.rt-public.id
  subnet_id = aws_subnet.sub-pub-1.id 
}
resource "aws_route_table_association" "rt-subnet_pub2" {
  route_table_id = aws_route_table.rt-public.id
  subnet_id = aws_subnet.sub-pub-2.id
}
resource "aws_route" "rt-gw-public" {
  route_table_id = aws_route_table.rt-public.id
  gateway_id = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  
}