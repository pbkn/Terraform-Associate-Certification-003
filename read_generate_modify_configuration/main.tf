resource "aws_eip" "lb" {
  domain = var.aws-lb-domain
  tags   = local.common_tags
}

resource "aws_s3_bucket" "bucket_1" {
  bucket = var.aws-bucket_1-name
  tags   = local.common_tags
}

resource "aws_instance" "ec2_1" {
  ami             = var.aws-ec2_1-ami[var.aws-region] #using map variable
  instance_type   = var.aws-ec2_1-instance_type[0]    #using list variable
  security_groups = [aws_security_group.allow_tls.name]

  tags = local.common_tags
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_1.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = var.aws-allow_tls-name
  description = var.aws-allow_tls-description

  dynamic "ingress" {
    for_each = var.dynamic-allow_tls-ports
    content {
      description = var.aws-allow_tls-ingress-description
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.aws-allow_tls-ingress-protocol
      cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    }
  }

  tags = local.common_tags
}

resource "aws_cognito_user_pool" "example_cognito_pool" {
  name = var.aws-example_cognito_pool-name
}

resource "aws_cognito_user" "example_cognito_user" {
  user_pool_id = aws_cognito_user_pool.example_cognito_pool.id
  username     = "${var.aws-example_cognito_user-username}-${count.index + 1}" #count index starts with 0, hence +1
  count        = var.isCommunity ? var.communityCount : var.nonCommunityCount  #no of users to be created
}
