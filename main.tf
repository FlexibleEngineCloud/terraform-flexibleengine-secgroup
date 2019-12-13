# Flexible Engine SecurityGroup

terraform {
  required_version = ">= 0.12.0"
}

resource "flexibleengine_networking_secgroup_v2" "secgroup" {
  name                 = "sg-${var.name}"
  description          = var.description
  delete_default_rules = var.delete_default_egress_rules
}

# Self Ingress rule

resource "flexibleengine_networking_secgroup_rule_v2" "self_ingress_rule_ipv4" {
  count             = var.create_self_ingress_rule ? 1 : 0
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_group_id   = flexibleengine_networking_secgroup_v2.secgroup.id
  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
}

resource "flexibleengine_networking_secgroup_rule_v2" "self_ingress_rule_ipv6" {
  count             = var.create_self_ingress_rule ? 1 : 0
  direction         = "ingress"
  ethertype         = "IPv6"
  remote_group_id   = flexibleengine_networking_secgroup_v2.secgroup.id
  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
}

# Ingress rule

resource "flexibleengine_networking_secgroup_rule_v2" "ingress_with_source_security_group_id" {
  count = length(var.ingress_with_source_security_group_id)

  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = var.ingress_with_source_security_group_id[count.index]["ethertype"]

  protocol        = var.ingress_with_source_security_group_id[count.index]["protocol"]
  port_range_min  = var.ingress_with_source_security_group_id[count.index]["from_port"]
  port_range_max  = var.ingress_with_source_security_group_id[count.index]["to_port"]
  remote_group_id = var.ingress_with_source_security_group_id[count.index]["source_security_group_id"]
}

resource "flexibleengine_networking_secgroup_rule_v2" "ingress_with_source_cidr" {
  count = length(var.ingress_with_source_cidr)

  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = var.ingress_with_source_cidr[count.index]["ethertype"]

  protocol         = var.ingress_with_source_cidr[count.index]["protocol"]
  port_range_min   = var.ingress_with_source_cidr[count.index]["from_port"]
  port_range_max   = var.ingress_with_source_cidr[count.index]["to_port"]
  remote_ip_prefix = var.ingress_with_source_cidr[count.index]["source_cidr"]
}

# Egress rule

resource "flexibleengine_networking_secgroup_rule_v2" "egress_with_source_security_group_id" {
  count = length(var.egress_with_source_security_group_id)

  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
  direction         = "egress"
  ethertype         = var.egress_with_source_security_group_id[count.index]["ethertype"]

  protocol        = var.egress_with_source_security_group_id[count.index]["protocol"]
  port_range_min  = var.egress_with_source_security_group_id[count.index]["from_port"]
  port_range_max  = var.egress_with_source_security_group_id[count.index]["to_port"]
  remote_group_id = var.egress_with_source_security_group_id[count.index]["destination_security_group_id"]
}

resource "flexibleengine_networking_secgroup_rule_v2" "egress_with_source_cidr" {
  count = length(var.egress_with_source_cidr)

  security_group_id = flexibleengine_networking_secgroup_v2.secgroup.id
  direction         = "egress"
  ethertype         = var.egress_with_source_cidr[count.index]["ethertype"]

  protocol         = var.egress_with_source_cidr[count.index]["protocol"]
  port_range_min   = var.egress_with_source_cidr[count.index]["from_port"]
  port_range_max   = var.egress_with_source_cidr[count.index]["to_port"]
  remote_ip_prefix = var.egress_with_source_cidr[count.index]["destination_cidr"]
}

