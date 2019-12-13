module "sg_ssh_bastion" {
  source  = "terraform-flexibleengine-modules/secgroup/flexibleengine"
  version = "1.0.0"

  name        = "sg_ssh_bastion"
  description = "Security group for SSH access on bastion"

  ingress_with_source_cidr = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      ethertype   = "IPv4"
      source_cidr = "0.0.0.0/0"
    }
  ]
}