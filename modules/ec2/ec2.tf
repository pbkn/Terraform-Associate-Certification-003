resource "aws_instance" "ec2" {
  ami             = "ami-049a62eb90480f276"
  instance_type   = "t2.micro"
}