variable "load_name" {
  description = "Enter the name for load balancer"
  type        = string
  default     = "app-load-balancer"
}

variable "load_bal_type" {
  description = "Enter the load balancer type"
  type        = string
  default     = "application"
}