variable "name" {
    type = string
}

variable "location" {
    type = string
}

variable "host_os" {
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

variable "network_interface_ids" {
    type = list
}

variable "os_customdata" {
  type = string
}