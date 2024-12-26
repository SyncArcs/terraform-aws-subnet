output "public_subnet_cidrs" {
  value       = module.subnets.public_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "public_subnet_cidrs_ipv6" {
  value       = module.subnets.public_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "private_subnet_cidrs" {
  value       = module.subnets.private_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "private_subnet_cidrs_ipv6" {
  value       = module.subnets.private_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "private_tags" {
  value       = module.subnets.private_tags
  description = "A mapping of tags to assign to the resource."
}

output "public_tags" {
  value       = module.subnets.public_tags
  description = "A mapping of tags to assign to the resource."
}

output "public_subnet_id" {
  value       = module.subnets.private_subnet_id
  description = "The ID of the public subnet"
}

output "private_subnet_id" {
  description = "The ID of the public-private subnet"
  value       = module.subnets.private_subnet_id
}

output "public_subnet_arn" {
  description = "The ARN of the public-private subnet"
  value       = module.subnets.public_subnet_arn
}

output "private_subnet_arn" {
  description = "The ARN of the public-private subnet"
  value       = module.subnets.private_subnet_arn
}

output "private_subnet_tags_all" {
  description = "A map of tags assigned to the public-private subnet, including those inherited from the provider default_tags configuration block"
  value       = module.subnets.private_subnet_tags_all
}

output "public_subnet_tags_all" {
  description = "A map of tags assigned to the public-private subnet, including those inherited from the provider default_tags configuration block"
  value       = module.subnets.public_subnet_tags_all
}

output "private_subnet_owner_id" {
  description = "The ID of the AWS account that owns the public-private subnet"
  value       = module.subnets.private_subnet_owner_id
}

output "public_subnet_owner_id" {
  description = "The ID of the AWS account that owns the public-private subnet"
  value       = module.subnets.public_subnet_owner_id
}

