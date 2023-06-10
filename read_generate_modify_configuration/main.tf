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
