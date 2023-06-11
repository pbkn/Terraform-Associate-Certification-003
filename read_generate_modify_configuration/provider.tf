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
