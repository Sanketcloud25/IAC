provider "aws" {
  region = "us-east-2"
}
variable "cidr_block_for_vpc" {
  description = "cidr range to use in the vpc"
  type = string
}
variable "cidr_block_for_sub_priv1" {
  description = "cider range of private subnet-1"
  type = string
}
variable "cidr_block_for_sub_priv2" {
  description = "cidr range for private subnet-2"
  type = string
}
variable "cidr_block_for_sub_pub1" {
  description = "cidr range for public subnet-1"
  type = string
}
variable "cidr_block_for_sub_pub2" {
  description = "cidr range for public subnet-2"
  type = string
}
variable "destination_cidr_block" {
  description = "destination cidr block for the nat gateways"
  type = string
}
variable "cidr_ipv4_sg" {
  description = "cidr range for ingress and egress rule in sg"
  type = string
}
variable "from_port_sg" {
  description = "from port for ingress and egress rule "
  type = number
}
variable "to_port_sg" {
  description = "to port for ingress and egress rule"
  type = number
}
variable "ip_protocol-sg" {
  description = "ip protocol for ingress and egress rule"
  type = string
}
variable "image_id" {
  description = "image_id for launch_template"
  type = string
}
variable "key_name" {
  description = "key to server and jump server(ssh)"
  type = string
}
variable "instance_type" {
  description = "instance type for server and jump server"
  type = string
}
variable "volume_size" {
  description = "ebs volume size for server and jump server"
  type = number
}
variable "volume_type" {
  description = "ebs volume type for server and jump server"
  type = string
}
variable "port_for_tg" {
  description = "port for target group"
  type = number
}
variable "protocol_for_tg" {
  description = "protocol for target group"
  type = string
}