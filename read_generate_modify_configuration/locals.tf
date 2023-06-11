locals {
  common_tags = var.local-common_tags
  time        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}