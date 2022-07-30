###########   Link = https://www.terraform.io/language/values/variables   #######

variable "vpc_cidr" {
  description = "Enter the CIDR range required for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostname"
  type        = bool
  default     = null
}

variable "enable_dns_support" {
  description = "enable_dns_support"
  type        = bool
  default     = null
}

variable "tag" {
  type    = string
  default = ""
}


variable "public_subnets_cidr_1" {
  description = "Cidr Block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnets_cidr_2" {
  description = "Cidr Block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "map_public_ip_on_launch" {
  description = "It will map the public ip while launching resources"
  type        = bool
  default     = null
}

variable "private_sub_db_cidr_1" {
  description = "mention the CIDR block for database subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_sub_db_cidr_2" {
  description = "mention the CIDR block for database subnet"
  type        = string
  default     = "10.0.4.0/24"
}