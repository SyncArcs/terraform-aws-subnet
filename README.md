# AWS Terraform Modules

This repository contains Terraform modules for managing AWS networking components, including VPC, Subnet, Route Table, and Internet Gateway. These modules help automate the setup of network infrastructure on AWS.

## Table of Contents

- [VPC Module](#vpc-module)
- [Subnet Module](#subnet-module)
- [Route Table Module](#route-table-module)
- [Internet Gateway Module](#internet-gateway-module)

## VPC Module

### Purpose

This module creates an AWS Virtual Private Cloud (VPC) with customizable CIDR blocks, DNS support, and hostnames.

### Inputs

| Name                      | Description                         | Type          | Default | Required |
|---------------------------|-------------------------------------|---------------|---------|----------|
| `cidr_block`              | The CIDR block for the VPC.         | `string`      | n/a     | yes      |
| `enable_dns_support`      | Whether DNS support is enabled.     | `bool`        | `true`  | no       |
| `enable_dns_hostnames`    | Whether DNS hostnames are enabled.  | `bool`        | `true`  | no       |
| `tags`                    | A map of tags to assign to the VPC. | `map(string)` | `{}`    | no       |

### Outputs

| Name                   | Description                        |
|------------------------|------------------------------------|
| `vpc_id`               | The ID of the created VPC.         |
| `vpc_cidr_block`       | The CIDR block of the VPC.         |
| `vpc_arn`              | The ARN of the VPC.                |
| `enable_dns_support`   | Whether DNS support is enabled.    |
| `enable_dns_hostnames` | Whether DNS hostnames are enabled. |

### Usage

module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "my-subnet"
  }
}

## Route Table Module

## Purpose

This module creates an AWS Route Table and manages its associations and routes.

| Name     | Description                       | Type          | Default | Required |
|----------|-----------------------------------|---------------|---------|----------|
| `vpc_id` | The ID of the VPC where th.       | `string`      | n/a     | yes      |
| `routes` | List of routes to be added to th. | `bool`        | `true`  | no       |
| `tags`   | A map of tags to assign to th.    | `bool`        | `true`  | no       |

### Outputs

| Name              | Description                                 |
|-------------------|---------------------------------------------|
| `route_table_id`  | The ID of the created route table.          |
| `vpc_id`          | The VPC ID associated with the route table. |
| `routes`          | List of routes in the route table.          |

### Usage
module "route_table" {
  source            = "./modules/route_table"
  vpc_id            = module.vpc.vpc_id
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway_id
    }
  ]
  tags = {
    Name = "my-route-table"
  }
}

## Internet Gateway Module

## Purpose

This module creates an AWS Internet Gateway and attaches it to a VPC.

## Inputs

| Name     | Description                     | Type     | Default | Required |
|----------|---------------------------------|----------|---------|----------|
| `vpc_id` | The ID of the VPC to attach.    | `string` | n/a     | yes      |
| `tags`   | A map of tags to assign to the. | `bool`   | `true`  | no       |

### Outputs

| Name                   | Description                                                 |
|------------------------|-------------------------------------------------------------|
| `internet_gateway_id`  | The ID of the created Internet Gateway.                     |
| `internet_gateway_arn` | The ARN of the created Internet Gateway.                    |
| `vpc_id`               | The ID of the VPC that the Internet Gateway is attached to. |

## Usage

module "internet_gateway" {
  source            = "./modules/internet_gateway"
  vpc_id            = module.vpc.vpc_id
  tags = {
    Name = "my-internet-gateway"
  }
}

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.9.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/SyncArcs/terraform-aws-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the subnet | `string` | `"us-east-2b"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the resources | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Order of the labels | `list(string)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | Managed by label | `string` | `""` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Map public IP on launch | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the resources | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository for the labels module | `string` | `null` | no |
| <a name="input_subnet_cidr_block"></a> [subnet\_cidr\_block](#input\_subnet\_cidr\_block) | CIDR block for the subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the Amazon Virtual Private Cloud (VPC) where the Internet Gateway will be attached. This VPC ID should be an existing VPC in your AWS account. The Internet Gateway enables communication between the instances in your VPC and the internet. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The ID of the Internet Gateway |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | The ID of the route table |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->