resource "aws_security_group" "allow_tls" {
  name        = var.aws-allow_tls-name
  description = var.aws-allow_tls-description

  ingress {
    description = var.aws-allow_tls-ingress-description
    from_port   = local.allow_tls-port
    to_port     = local.allow_tls-port
    protocol    = var.aws-allow_tls-ingress-protocol
  }

  tags = local.common_tags
}
