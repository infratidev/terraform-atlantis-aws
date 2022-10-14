variable "region" {
    description = "Default region"
    default = "us-east-1"
}
variable "instance_type" {
    description = "Default Instance"
    default     =  "t2.micro"
}

variable "vpc_cidr" {
    description = "VPC InfraTI"
    default = "178.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "Public Subnet InfraTI Web Server"
    default = "178.0.10.0/24"
}

variable "env" {
  description = "Environment"
  default     = "Development"
}

variable "name" {
  description = "Nome da aplicação"
  default     = "infrati-ec2server01"
}

