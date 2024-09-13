## Managed By : SyncArcs
## Description : This Script is used to create Transfer Server, Transfer User And label .
## Copyright @ SyncArcs. All Right Reserved.
#
module "labels" {
  source      = "git::https://github.com/SyncArcs/terraform-aws-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}


resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = var.name
    Environment = var.environment
    ManagedBy   = var.managedby

  }
}

# Internet Gateway Resource
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id

  tags = {
    Name        = var.name
    Environment = var.environment
    ManagedBy   = var.managedby


  }
}

# Route Table Resource
resource "aws_route_table" "test" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = var.name
    Environment = var.environment
    ManagedBy   = var.managedby


  }
}

# Route Table Association Resource
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.test.id
}


