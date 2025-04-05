variable "ami" {
  description = "AMI ID"
  type = string
}

variable "instance_type" {
  description = "Type for the EC2 Instance"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type = string
}
