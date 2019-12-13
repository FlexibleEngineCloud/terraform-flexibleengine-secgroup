# Flexible Engine Security Group Terraform Module

Terraform module which creates security groups and associated rules resources on Flexible Engine.

## Terraform version v0.12


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_self\_ingress\_rule | Wheter or not create default self ingress rules (allow all protocols from this group) | string | `"true"` | no |
| delete\_default\_egress\_rules | Wheter or not create default egress rules (allow all protocols to any destination) | string | `"false"` | no |
| description | The security group description | string | `"Security Group managed by Terraform"` | no |
| egress\_with\_source\_cidr | List of egress rules to create where a CIDR is remote | list(object({from_port=number,to_port=number,protocol=string,ethertype=string,destination_cidr=string})) | `<list>` | no |
| egress\_with\_source\_security\_group\_id | List of egress rules to create where a security group is remote | list(object({from_port=number,to_port=number,protocol=string,ethertype=string,destination_security_group_id=string})) | `<list>` | no |
| ingress\_with\_source\_cidr | List of ingress rules to create where a CIDR is remote | list(object({from_port=number,to_port=number,protocol=string,ethertype=string,source_cidr=string})) | `<list>` | no |
| ingress\_with\_source\_security\_group\_id | List of ingress rules to create where a security group is remote | list(object({from_port=number,to_port=number,protocol=string,ethertype=string,source_security_group_id=string})) | `<list>` | no |
| name | The security group name (will be prefixed with `sg-`) | string | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the security group |
| name | The name of the security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->