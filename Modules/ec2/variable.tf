variable "env" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string

  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Only allowed instance types are t2.micro, t3.micro, t3.small"
  }
}

variable "instance_count" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "user_data_path" {
  type = string
}