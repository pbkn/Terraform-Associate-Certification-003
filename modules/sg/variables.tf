variable "aws-allow_tls-name" {
  type    = string
  default = "allow_tls"
}
variable "aws-allow_tls-description" {
  type    = string
  default = "Allow TLS inbound traffic"
}
variable "aws-allow_tls-ingress-description" {
  type    = string
  default = "TLS from EC2 public eip"
}
variable "aws-allow_tls-ingress-protocol" {
  type    = string
  default = "tcp"
}

variable "local-common_tags" {
  type = map(string)
  default = {
    Owner = "tf"
  }
}
