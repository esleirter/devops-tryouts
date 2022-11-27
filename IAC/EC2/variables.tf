variable "project" {
  type = string
}

variable "sg_cidr_blocks" {
  type    = list(string)
  # For testign default allow all
  default = ["0.0.0.0/0"]
}

variable "size_volumen" {
  type = number
  default = 30
}