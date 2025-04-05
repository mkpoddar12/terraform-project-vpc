variable "region" {
  description = "AWS region"
  type = string
}

varibale "vpc_cidr" {
	description = "CIDR block for the VPC"
	type = string
}

variable "vpc_name" {
	description = "Name for the VPC"
	type = string
}

variable "public_subnets" {
	description = "List of public subnet CIDRs"
	type = list(string)
}

variable "availability_zones" {
	description = "List of availability zones"
	type = list(string)
}

variable "ami" {
  description = "AMI ID"
  type = string
}

variable "instance_type" {
  description = "Name for the EC2 Instance"
  type = string
}

variable "profile" {
  description = "AWS profile"
  type = string
}
