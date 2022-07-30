
variable "engine_name" {
  description = "Enter the DB engine"
  type        = string
  default     = "mysql"
}


variable "engine_version" {
  description = "Enter the DB engine version"
  type        = number
  default     = "5.7"
}

variable "instance_class" {
  description = "Enter the DB instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Enter the DB name to be created inside db instance"
  type        = string
  default     = "my_database"
}


variable "username" {
  description = "Enter the usrname for db"
  type        = string
  default     = "student"
}


variable "password" {
  description = "Enter the password for db"
  type        = string
  default     = "student123"
}


