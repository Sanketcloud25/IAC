resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_nat_gateway" "ngw-1" {
  subnet_id = aws_subnet.sub-pub-1.id
  allocation_id = aws_eip.eip_ngw1.id
}
resource "aws_eip" "eip_ngw1" {
}
resource "aws_nat_gateway" "ngw2" {
  subnet_id = aws_subnet.sub-pub-2.id
  allocation_id = aws_eip.eip_ngw2.id
}
resource "aws_eip" "eip_ngw2" {
}