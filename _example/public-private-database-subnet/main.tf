provider "aws" {
  region = "eu-west-1"
}


##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source      = "git::https://github.com/SyncArcs/terraform-aws-vpc.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  cidr_block  = "10.0.0.0/16"

}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------

module "subnet" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  availability_zones  = ["eu-west-1a", "eu-west-1b", ]
  vpc_id              = module.vpc.vpc_id
  type                = "public-private-database"
  nat_gateway_enabled = true
  single_nat_gateway  = true
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  igw_id              = module.vpc.igw_id
  enable_ipv6         = true
}
