variable "vpc_cidr_block" {
  description = "Range of IPv4 address for the VPC"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  default = "2"
}

variable "ami" {
  default = {
    "us-east-1": "ami-03d315ad33b9d49c4"
  }
}

variable "instance_count" {
  default = 3
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}
