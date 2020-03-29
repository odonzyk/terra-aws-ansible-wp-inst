variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "instance" {
  default = "t2.micro"
}

variable "instance_count" {
  default = "1"
}

variable "private_key_aws_path" {
    type = string
    default = "/root/.ssh/aws"
}

variable "ansible_user" {
  default = "ubuntu"
}

variable "ami" {
  default = "ami-0a4f4704a9146742a"
}