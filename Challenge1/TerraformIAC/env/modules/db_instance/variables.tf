variable "allocated_storage" {
    type = number
    default = 10
}

variable "instance_class"{
    type = string
    default = "db.t3.micro"
}

variable "username"{
    type = string
    sensitive = true
}

variable "password"{
    type = string
    sensitive = true
}

variable "Name"{
    type = string
}

variable "vpc_security_group_ids"{
    type = list
}

variable "subnet_ids"{
    type = string
}

variable "environment"{
    type = string
}