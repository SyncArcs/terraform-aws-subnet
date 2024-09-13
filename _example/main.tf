terraform {
  required_version = ">= 1.0.0" # Ensures you're using Terraform 1.0.0 or higher

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Specify a version constraint for the AWS provider
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source      = "git::https://github.com/SyncArcs/terraform-aws-vpc.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  managedby   = "SyncArcs"
  cidr_block  = "10.0.0.0/16"
  label_order = ["name", "environment"]
}

module "subnet" {
  source            = "../."
  name              = "app"
  environment       = "test"
  managedby         = "SyncArcs"
  vpc_id            = module.vpc.id
  subnet_cidr_block = "10.0.1.0/24"
  label_order       = ["name", "environment"]

}
