#AWS provider
variable "aws-region" {
  type = string
}

#AWS eip
variable "aws-lb-domain" {
  type = string
}

#AWS s3_bucket
variable "aws-bucket_1-name" {
  type = string
}

#AWS ec2
variable "aws-ec2_1-ami" {
  type    = map(any) #use case for map
  default = null
}
variable "aws-ec2_1-instance_type" {
  type    = list(any) #use case for list
  default = null
}

#AWS security group
variable "aws-allow_tls-name" {
  type = string
}
variable "aws-allow_tls-description" {
  type = string
}
variable "aws-allow_tls-ingress-description" {
  type = string
}
variable "aws-allow_tls-ingress-protocol" {
  type = string
}
variable "dynamic-allow_tls-ports"{
  type = list(number)
}

#AWS Cognito
variable "aws-example_cognito_pool-name" {
  type = string
}
variable "aws-example_cognito_user-username" {
  type = string
}

#UserData
variable "isCommunity" {
  type = bool
}
variable "communityCount" {
  type = number
}
variable "nonCommunityCount" {
  type = number
}

#locals
variable "local-common_tags" {
  type = map(any)
}
