variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `prod-subnet` or `subnet`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/SyncArcs/terraform-aws-subnet"
  description = "Terraform current module repo"
}
variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`Environment`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "extra_public_tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "extra_private_tags" {
  type        = map(any)
  default     = {}
  description = "Additional private subnet tags."
}

variable "managedby" {
  type        = string
  default     = "info@SyncArcs.com"
  description = "ManagedBy, eg 'info@SyncArcs.com'"
}

variable "extra_database_tags" {
  type        = map(any)
  default     = {}
  description = "Additional private subnet tags."
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)."
}

variable "type" {
  type        = string
  default     = ""
  description = "Type of subnets to create (`private` or `public`)."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the public and private subnets will be created."
}

variable "cidr_block" {
  type        = string
  default     = null
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

variable "ipv6_cidr_block" {
  type        = string
  default     = null
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = []
  sensitive   = true
  description = "A list of public subnet ids."
  #  sensitive   = true
}

variable "igw_id" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Internet Gateway ID that is used as a default route when creating public subnets (e.g. `igw-9c26a123`)."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "enable_public_acl" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "enable_private_acl" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "nat_gateway_enabled" {
  type        = bool
  default     = false
  description = "Flag to enable/disable NAT Gateways creation in public subnets."
}

variable "enable_flow_log" {
  type        = bool
  default     = false
  description = "Enable subnet_flow_log logs."
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = false
  description = "Specify true to indicate that instances launched into the public subnet should be assigned a public IP address."
}

variable "public_ipv6_cidrs" {
  type        = list(any)
  default     = []
  description = "Public Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`)."
}

variable "private_ipv6_cidrs" {
  type        = list(any)
  default     = []
  description = "Private Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`)."
}

variable "ipv4_public_cidrs" {
  type        = list(any)
  default     = []
  description = "Subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}
variable "ipv4_private_cidrs" {
  type        = list(any)
  default     = []
  description = "Subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "Enable for only single NAT Gateway in one Availability Zone"
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address."
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address."
}

variable "public_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  default     = "ip-name" # or "resource-name", depending on your requirement
  description = "The type of private DNS hostname to assign to instances in this subnet at launch. Must be either 'ip-name' or 'resource-name'."
}

variable "private_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  default     = null
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
}

variable "public_subnet_ipv6_native" {
  type        = bool
  default     = false
  description = "Indicates whether to create an IPv6-only public subnet. Default: `false`"
}

variable "private_subnet_ipv6_native" {
  type        = bool
  default     = false
  description = "Indicates whether to create an IPv6-only private subnet. Default: `false`"
}

variable "enable_ipv6" {
  type        = bool
  default     = false
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block"
}

variable "public_subnet_enable_dns64" {
  type        = bool
  default     = false
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
}

variable "private_subnet_enable_dns64" {
  type        = bool
  default     = false
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
}

variable "public_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
}

variable "private_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
}

variable "public_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
}

variable "private_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
}

variable "public_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "Public subnets inbound network ACLs"
}

variable "public_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "Public subnets outbound network ACLs"
}

variable "private_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "Private subnets inbound network ACLs"
}

variable "private_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "Private subnets outbound network ACLs"
}

variable "nat_gateway_destination_cidr_block" {
  type        = string
  default     = "0.0.0.0/0" # Commonly used for internet access
  description = "The CIDR block for the NAT gateway route."
}

variable "public_rt_ipv4_destination_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The destination ipv4 CIDR block."
}

variable "public_rt_ipv6_destination_cidr" {
  type        = string
  default     = "::/0"
  description = "The destination ipv6 CIDR block."
}

variable "ipv4_database_cidrs" {
  type        = list(any)
  default     = []
  description = "Subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

variable "database_ipv6_cidrs" {
  type        = list(any)
  default     = []
  description = "database Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`)."
}

variable "map_database_ip_on_launch" {
  type        = bool
  default     = false
  description = "Specify true to indicate that instances launched into the database subnet should be assigned a public IP address."
}

variable "database_subnet_ipv6_native" {
  type        = bool
  default     = false
  description = "Indicates whether to create an IPv6-only database subnet. Default: `false`"
}

variable "database_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  default     = null
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
}

variable "database_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
}

variable "database_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  default     = false
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
}

variable "database_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address."
}

variable "database_subnet_enable_dns64" {
  type        = bool
  default     = false
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
}

variable "enable_database_acl" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "database_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "database subnets inbound network ACLs"
}

variable "database_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "database subnets outbound network ACLs"
}

variable "enable_lni_at_device_index" {
  type        = number
  default     = null # Default to null (disabled unless specified)
  description = "Indicates the device position for local network interfaces in this subnet. This is used for AWS Outposts only."
}

variable "map_customer_owned_ip_on_launch" {
  type        = bool
  default     = false
  description = "Whether to map customer-owned IPs on launch"
}

variable "customer_owned_ipv4_pool" {
  type        = string
  default     = ""
  description = "The customer-owned IPv4 address pool for the subnet"
}

variable "outpost_arn" {
  type        = string
  default     = ""
  description = "The ARN of the Outpost to create the subnet in"
}

output "created_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "The IDs of the subnets created in the public availability zones."
}

##### database_subnet_flow_log #####

variable "flow_log_destination_arn" {
  type        = string
  default     = null
  sensitive   = true
  description = "ARN of resource in which flow log will be sent."
}

variable "flow_log_destination_type" {
  type        = string
  default     = "cloud-watch-logs"
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs"
}

variable "flow_log_traffic_type" {
  type        = string
  default     = "ALL"
  description = "Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
}

variable "flow_log_log_format" {
  type        = string
  default     = null
  description = "The fields to include in the flow log record, in the order in which they should appear"
}

variable "flow_log_iam_role_arn" {
  type        = string
  default     = null
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided"
}

variable "flow_log_max_aggregation_interval" {
  type        = number
  default     = 600
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds"
}

##### Optional variables added

variable "flow_log_deliver_cross_account_role" {
  type        = string
  default     = null
  description = "The ARN of the IAM role that allows Amazon EC2 to publish flow logs across accounts."
}

variable "flow_log_eni_id" {
  type        = string
  default     = null
  description = "Elastic Network Interface ID to attach to."
}

variable "flow_log_transit_gateway_id" {
  type        = string
  default     = null
  description = "Transit Gateway ID to attach to."
}

variable "flow_log_transit_gateway_attachment_id" {
  type        = string
  default     = null
  description = "Transit Gateway Attachment ID to attach to."
}

# Variables for destination options (if logging to S3)

variable "flow_log_file_format" {
  type        = string
  default     = null
  description = "(Optional) The format for the flow log. Valid values: `plain-text`, `parquet`"
}

variable "flow_log_hive_compatible_partitions" {
  type        = bool
  default     = false
  description = "(Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3"
}

variable "flow_log_per_hour_partition" {
  type        = bool
  default     = false
  description = "(Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries"
}

variable "flow_log_vpc_id" {
  type        = string
  default     = null
  description = "VPC ID to attach to."
}

variable "eni_id" {
  type        = string
  default     = null
  description = "Elastic Network Interface ID to attach to."
}

variable "transit_gateway_id" {
  type        = string
  default     = null
  description = "Transit Gateway ID to attach to."
}

variable "deliver_cross_account_role" {
  type        = string
  default     = null
  description = "ARN of the IAM role that allows Amazon EC2 to publish flow logs across accounts."
}
