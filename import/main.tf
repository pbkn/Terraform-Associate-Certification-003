resource "aws_instance" "ec2" {
  ami = "" #mandatory param to configure import
  instance_type = "" #mandatory param to configure import
}

resource "aws_s3_bucket" "s3" {
  bucket = "" #optional param to configure import
}
