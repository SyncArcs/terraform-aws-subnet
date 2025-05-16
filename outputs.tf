output "public_subnet_id" {
  value       = aws_subnet.public[*].id
  description = "The ID of the subnet."
}

output "public_subnet_cidrs" {
  value       = aws_subnet.public[*].cidr_block
  description = "CIDR blocks of the created public subnets."
}

output "public_subnet_cidrs_ipv6" {
  value       = aws_subnet.public[*].ipv6_cidr_block
  description = "CIDR blocks of the created public subnets."
}

output "private_subnet_id" {
  value       = aws_subnet.private[*].id
  description = "The ID of the private subnet."
}

output "private_subnet_cidrs" {
  value       = aws_subnet.private[*].cidr_block
  description = "CIDR blocks of the created private subnets."
}

output "private_subnet_cidrs_ipv6" {
  value       = aws_subnet.private[*].ipv6_cidr_block
  description = "CIDR blocks of the created private subnets."
}

output "public_route_tables_id" {
  value       = aws_route_table.public[*].id
  description = "The ID of the routing table."
}

output "private_route_tables_id" {
  value       = aws_route_table.private[*].id
  description = "The ID of the routing table."
}

output "private_tags" {
  value       = module.private-labels.tags
  description = "A mapping of private tags to assign to the resource."
}

output "public_tags" {
  value       = module.public-labels.tags
  description = "A mapping of public tags to assign to the resource."
}

output "public_acl" {
  value       = join("", aws_network_acl.public[*].id)
  description = "The ID of the network ACL."
}

output "private_acl" {
  value       = join("", aws_network_acl.private[*].id)
  description = "The ID of the network ACL."
}

output "database_subnet_id" {
  value       = aws_subnet.database[*].id
  description = "The ID of the subnet."
}

output "database_subnet_cidrs" {
  value       = aws_subnet.database[*].cidr_block
  description = "CIDR blocks of the created database subnets."
}

output "database_subnet_cidrs_ipv6" {
  value       = aws_subnet.database[*].ipv6_cidr_block
  description = "CIDR blocks of the created database subnets."
}

output "database_acl" {
  value       = join("", aws_network_acl.database[*].id)
  description = "The ID of the network ACL."
}

output "database_route_tables_id" {
  value       = aws_route_table.database[*].id
  description = "The ID of the routing table."
}
output "database_tags" {
  value       = module.database-labels.tags
  description = "A mapping of public tags to assign to the resource."
}

output "public_subnet_arn" {
  value       = aws_subnet.public[*].arn
  description = "ARNs of all public subnets"
}

output "public_subnet_ipv6_cidr_block_association_id" {
  value       = aws_subnet.public[*].ipv6_cidr_block_association_id
  description = "IPv6 CIDR block association IDs for public subnets"
}

output "public_subnet_owner_id" {
  value       = aws_subnet.public[*].owner_id
  description = "Owner IDs of all public subnets"
}

output "public_subnet_tags_all" {
  value       = aws_subnet.public[*].tags_all
  description = "All tags for public subnets"
}

output "public_private_subnet_arn" {
  value       = aws_subnet.private[*].arn
  description = "ARNs of all public/private subnets"
}

output "public_private_subnet_ipv6_cidr_block_association_id" {
  value       = aws_subnet.private[*].ipv6_cidr_block_association_id
  description = "IPv6 CIDR block association IDs for public/private subnets"
}

output "public_private_subnet_owner_id" {
  value       = aws_subnet.private[*].owner_id
  description = "Owner IDs of all public/private subnets"
}

output "public_private_subnet_tags_all" {
  value       = aws_subnet.private[*].tags_all
  description = "All tags for public/private subnets"
}

output "database_subnet_arn" {
  value       = aws_subnet.database[*].arn
  description = "ARNs of all database subnets"
}

output "database_subnet_ipv6_cidr_block_association_id" {
  value       = aws_subnet.database[*].ipv6_cidr_block_association_id
  description = "IPv6 CIDR block association IDs for database subnets"
}

output "database_subnet_owner_id" {
  value       = aws_subnet.database[*].owner_id
  description = "Owner IDs of all database subnets"
}

output "database_subnet_tags_all" {
  value       = aws_subnet.database[*].tags_all
  description = "All tags for database subnets"
}

output "private_subnet_owner_id" {
  value       = length(aws_subnet.private) > 0 ? aws_subnet.private[0].owner_id : null
  description = "Owner ID of the first private subnet, if it exists"
}

output "public_private_subnet_id" {
  value       = length(aws_subnet.private) > 0 ? aws_subnet.private[0].id : null
  description = "ID of the first private subnet, if it exists"
}

output "private_subnet_tags_all" {
  value       = length(aws_subnet.private) > 0 ? aws_subnet.private[0].tags_all : null
  description = "All tags for the first private subnet, if it exists"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "IDs of all public subnets"
}

output "nat_gateway_ids" {
  value       = aws_nat_gateway.private[*].id
  description = "IDs of all NAT gateways"
}

output "private_subnet_arn" {
  value       = aws_subnet.private[*].arn
  description = "ARNs of all private subnets"
}

output "private_subnet_vpc_id" {
  value       = aws_subnet.private[*].vpc_id
  description = "VPC IDs of all private subnets"
}

output "route_table_vpc_id" {
  value       = aws_route_table.private[*].vpc_id
  description = "VPC IDs of all private route tables"
}

output "nat_gateway_subnet_id" {
  value       = aws_nat_gateway.private[*].subnet_id
  description = "Subnet IDs for all NAT gateways"
}

#####database-flow_log

output "flow_log_id" {
  value       = aws_flow_log.database_subnet_flow_log[*].id
  description = "The Flow Log ID."
}

output "flow_log_arn" {
  value       = aws_flow_log.database_subnet_flow_log[*].arn
  description = "The ARN of the Flow Log."
}

output "flow_log_tags_all" {
  value       = aws_flow_log.database_subnet_flow_log[*].tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
