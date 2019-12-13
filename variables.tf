variable "name" {
  description = "The security group name"
  type        = string
}

variable "description" {
  description = "The security group description"
  default     = "Security Group managed by Terraform"
  type        = string
}

variable "create_self_ingress_rule" {
  description = "Wheter or not create default self ingress rules (allow all protocols from this group)"
  default     = true
}

variable "delete_default_egress_rules" {
  description = "Wheter or not create default egress rules (allow all protocols to any destination)"
  default     = false
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where a security group is remote"
  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    ethertype                = string
    source_security_group_id = string
  }))
  default = []
}

variable "ingress_with_source_cidr" {
  description = "List of ingress rules to create where a CIDR is remote"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    ethertype   = string
    source_cidr = string
  }))
  default = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where a security group is remote"
  type = list(object({
    from_port                     = number
    to_port                       = number
    protocol                      = string
    ethertype                     = string
    destination_security_group_id = string
  }))
  default = []
}

variable "egress_with_source_cidr" {
  description = "List of egress rules to create where a CIDR is remote"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    ethertype        = string
    destination_cidr = string
  }))
  default = []
}

variable "endpoint" {
  description = "Endpoint URL of the Flexible Engine provider"
  type        = string
  default     = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
}

variable "region" {
  description = "Region of the Flexible Engine provider"
  type        = string
  default     = "eu-west-0"
}
