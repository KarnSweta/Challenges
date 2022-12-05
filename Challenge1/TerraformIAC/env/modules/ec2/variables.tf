variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "availability_zone" {
    type = string
    default = "us-east-1"
}

variable "vpc_security_group_ids"{
    type = list
}

variable "subnet_id"{
    type = string
}

variable "name"{
    type = string
}

variable "instance_count"{
    type = number
    default = 1
}