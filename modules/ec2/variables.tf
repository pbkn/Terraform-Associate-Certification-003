variable "ami" {
  type    = string
  default = "ami-049a62eb90480f276"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = [ "default-sg" ]
}
