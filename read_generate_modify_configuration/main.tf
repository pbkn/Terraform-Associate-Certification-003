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
  region = var.aws-region
  # authentication set as env variable in terraform cloud
}

resource "aws_eip" "lb" {
  domain = var.aws-lb-domain
}

output "lb" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "bucket_1" {
  bucket = var.aws-bucket_1-name
}

output "bucket_1" {
  value = aws_s3_bucket.bucket_1.bucket_domain_name
}

resource "aws_instance" "ec2_1" {
  ami             = var.aws-ec2_1-ami[var.aws-region] #using map variable
  instance_type   = var.aws-ec2_1-instance_type[0]    #using list variable
  security_groups = [aws_security_group.allow_tls.name]

  tags = {
    "tf" = "ec2-1"    #Custom propery for bill tracking with key "tf"
    Name = "tf-ec2-1" #EC2 name property
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_1.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = var.aws-allow_tls-name
  description = var.aws-allow_tls-description

  ingress {
    description = var.aws-allow_tls-ingress-description
    from_port   = var.aws-allow_tls-ingress-from_port
    to_port     = var.aws-allow_tls-ingress-to_port
    protocol    = var.aws-allow_tls-ingress-protocol
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_cognito_user_pool" "example_cognito_pool" {
  name = var.aws-example_cognito_pool-name
}

resource "aws_cognito_user" "example_cognito_user" {
  user_pool_id = aws_cognito_user_pool.example_cognito_pool.id
  username     = "${var.aws-example_cognito_user-username}-${count.index + 1}" #count index starts with 0, hence +1
  count        = var.isCommunity ? var.communityCount : var.nonCommunityCount  #no of users to be created
}
