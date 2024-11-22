provider "aws" {
  region = "us-west-1"
}

##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source                              = "git::https://github.com/SyncArcs/terraform-aws-vpc.git?ref=v1.0.0"
  name                                = "app"
  environment                         = "test"
  cidr_block                          = "10.0.0.0/16"
  managedby                           = "SyncArcs"
  enable_flow_log                     = false
  create_flow_log_cloudwatch_iam_role = false
  additional_cidr_block               = ["172.3.0.0/16", "172.2.0.0/16"]
  dhcp_options_domain_name            = "service.consul"
  dhcp_options_domain_name_servers    = ["127.0.0.1", "10.10.0.2"]
  assign_generated_ipv6_cidr_block    = true
}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------

module "subnet" {
  source             = "./../.."
  name               = "app"
  environment        = "test"
  managedby          = "SyncArcs"
  availability_zones = ["us-west-1b"]
  vpc_id             = module.vpc.id
  type               = "public"
  igw_id             = module.vpc.igw_id
  ipv4_public_cidrs  = ["10.0.1.0/24"]
  enable_ipv6        = false
}









module "private-subnets" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  availability_zones  = ["us-west-1b"]
  vpc_id              = module.vpc.id
  type                = "private"
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  ipv4_private_cidrs  = ["10.0.3.0/24"]
  public_subnet_ids   = module.subnet.public_subnet_id
}
