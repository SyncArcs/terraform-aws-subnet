variable "name" {
  description = "Name for the resources"
  type        = string
  default     = ""
}
#
variable "environment" {
  description = "Environment for the resources"
  type        = string
  default     = ""
}

variable "managedby" {
  description = "Managed by label"
  type        = string
  default     = ""
}

variable "label_order" {
  description = "Order of the labels"
  type        = list(string)
  default     = []
}

variable "repository" {
  description = "Repository for the labels module"
  type        = string
  default     = null
}


variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-2b"
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch"
  type        = bool
  default     = true
}



variable "vpc_id" {
  description = "The ID of the Amazon Virtual Private Cloud (VPC) where the Internet Gateway will be attached. This VPC ID should be an existing VPC in your AWS account. The Internet Gateway enables communication between the instances in your VPC and the internet."
  type        = string
  default     = ""
}

