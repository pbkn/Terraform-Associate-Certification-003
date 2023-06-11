terraform {
  cloud {
    organization = "pbkn-org" #Terraform cloud organization name
    workspaces {
      name = "tfc-vs-pbkn-pc" #Terraform cloud workspace
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  # authentication set as env variable in terraform cloud
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

output "lb" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "bucket_1" {
  bucket = "pbkn-tf-bucket"
}

output "bucket_1" {
  value = aws_s3_bucket.bucket_1.bucket_domain_name
}

resource "aws_instance" "tf-ec2" {
  ami             = "ami-049a62eb90480f276"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_tls.name]

  tags = {
    "tf" = "ec2-1"    #Custom propery for bill tracking with key "tf"
    Name = "tf-ec2-1" #EC2 name property
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.tf-ec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from EC2 public eip"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

  tags = {
    Name = "allow_tls"
  }
}
