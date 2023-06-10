terraform {
  cloud {
    organization = "pbkn-org" #Terraform cloud organization name
    workspaces {
      name = "tfc-vs-pbkn-pc"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-049a62eb90480f276"
  instance_type = "t2.micro"

  tags = {
    "tf" = "ec2-1"
    Name = "tf-ec2-1"
  }
}
