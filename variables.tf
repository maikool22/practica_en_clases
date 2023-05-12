variable "ami-id" {
  description = "Id de la Ami"
  type        = string
  default     = "ami-02396cdd13e9a1257" # si no le seteo un valor por defaul, terraforn no va a poder hacer nada
  # mientras yo no le asigne un valor a la variable, usara el por defecto
}
variable "vpc_cidr" {
  description = "CIDR para VPC"
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet de CIDR"
  default     = "172.16.1.0/24"
}
variable "vpc_aws_az" {
  description = "Zona de disponibilidad para VPC"
  default     = "us-east-1a"
}
