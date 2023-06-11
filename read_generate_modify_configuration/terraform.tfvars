#AWS provider
aws-region = "ap-south-1"

#AWS eip
aws-lb-domain = "vpc"

#AWS s3_bucket
aws-bucket_1-name= "pbkn-tf-bucket"

#AWS ec2
aws-ec2_1-ami             = {ap-south-1: "ami-049a62eb90480f276"}
aws-ec2_1-instance_type   = ["t2.micro"]

#AWS security group
aws-allow_tls-name        = "allow_tls"
aws-allow_tls-description = "Allow TLS inbound traffic"
aws-allow_tls-ingress-description = "TLS from EC2 public eip"
aws-allow_tls-ingress-from_port   = 443
aws-allow_tls-ingress-to_port     = 443
aws-allow_tls-ingress-protocol    = "tcp"

#AWS cognito
aws-example_cognito_pool-name = "tf-user-pool"
aws-example_cognito_user-username = "tf-user"