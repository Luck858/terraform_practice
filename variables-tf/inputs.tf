# -------------------
# VPC Variables
# -------------------
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "192.168.0.0/16"
}

# -------------------
# Subnet Variables
# -------------------
variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR block"
  default     = "192.168.1.0/24"
}

variable "subnet_az" {
  type        = string
  description = "Subnet Availability Zone"
  default     = "ap-south-1a"
}
