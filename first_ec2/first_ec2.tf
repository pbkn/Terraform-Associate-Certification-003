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
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  # authentication set as env variable in terraform cloud
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-049a62eb90480f276" 
  instance_type = "t2.micro"

  tags = {
    "tf" = "ec2-1" #Custom propery for bill tracking with key "tf"
    Name = "tf-ec2-1" #EC2 name property
  }
}
