resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_for_vpc
}
resource "aws_subnet" "sub-priv-1" {
  cidr_block = var.cidr_block_for_sub_priv1
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-2a"
}
resource "aws_subnet" "sub-priv-2" {
  cidr_block = var.cidr_block_for_sub_priv2
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-2b"
}
resource "aws_subnet" "sub-pub-1" {
  cidr_block = var.cidr_block_for_sub_pub1
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-2a"
}
resource "aws_subnet" "sub-pub-2" {
  cidr_block = var.cidr_block_for_sub_pub2
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-2b"
}