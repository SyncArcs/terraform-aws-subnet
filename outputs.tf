output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.labels
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.main.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = aws_route_table.test.id
}
