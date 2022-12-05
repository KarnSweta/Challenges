variable "vpc_cidr"{
    type = string
}

variable "environment"{
    type = string
}

variable "public_subnets_cidr"{
    type = list
}

variable "private_subnets_cidr" {
    type = list
}

variable "availability_zones" {
    type = list
}