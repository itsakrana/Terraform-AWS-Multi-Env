variable "ami" {
  type = string
}

variable "instance_type" {
  type = string

  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Only allowed instance types: t2.micro, t3.micro, t3.small"
  }
}