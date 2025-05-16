output "database_subnet_cidrs" {
  value       = module.subnet.database_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "database_subnet_cidrs_ipv6" {
  value       = module.subnet.database_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "database_tags" {
  value       = module.subnet.database_tags
  description = "A mapping of tags to assign to the resource."
}

output "database_subnet_id" {
  value       = module.subnet.database_subnet_id
  description = "The ID of the public subnet"
}

output "database_subnet_arn" {
  value       = module.subnet.database_subnet_arn
  description = "The ID of the database subnet"
}

output "database_subnet_tags_all" {
  value       = module.subnet.database_subnet_tags_all
  description = "The ARN of the database subnet"
}

output "database_subnet_owner_id" {
  value       = module.subnet.database_subnet_owner_id
  description = "A map of tags assigned to the database subnet, including those inherited from the provider default_tags configuration block"
}