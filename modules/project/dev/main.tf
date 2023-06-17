module "ec2module" {
  source = "../../ec2"
  vpc_security_group_ids = [ module.sgmodule.sg_id ]
}

module "sgmodule" {
  source = "../../sg"
}
