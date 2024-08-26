variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {
        environment = "dev"
    }
}

variable "subnet_id" {
    type = string
}