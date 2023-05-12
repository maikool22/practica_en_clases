#Creo VPC
resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = var.vpc_cidr ##Bloque cidr pasado por variable.
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}
# Creo subnet
resource "aws_subnet" "test-terraform-subnet" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id
  cidr_block              = var.subnet_cidr # Llamo variable de la subnet
  availability_zone       = var.vpc_aws_az  ##Notar la variable para la AZ asignada a la subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet"
  }
}
# Creamos el internet gateway
resource "aws_internet_gateway" "test-terraform-internet-gateway" {
  vpc_id = aws_vpc.practico-terraform-vpc.id
  tags = {
    Name = "test-terraform-ig"
  }
}
# Aca usamos la tabla por defecto, la asociamos al vpc y decimos que todo el trafico vaya por el ig
resource "aws_default_route_table" "test-terraform-rt-default" {
  default_route_table_id = aws_vpc.practico-terraform-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-terraform-internet-gateway.id
  }

  tags = {
    Name = "test-terraform-rt-default"
  }
}
