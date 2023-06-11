#AWS provider
variable "aws-region" {}

#AWS eip
variable "aws-lb-domain" {}

#AWS s3_bucket
variable "aws-bucket_1-name" {}

#AWS ec2
variable "aws-ec2_1-ami" {}
variable "aws-ec2_1-instance_type" {}

#AWS security group
variable "aws-allow_tls-name" {}
variable "aws-allow_tls-description" {}
variable "aws-allow_tls-ingress-description" {}
variable "aws-allow_tls-ingress-from_port" {}
variable "aws-allow_tls-ingress-to_port" {}
variable "aws-allow_tls-ingress-protocol" {}
