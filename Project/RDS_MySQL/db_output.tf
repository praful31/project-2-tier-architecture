#############   Link = https://www.terraform.io/language/values/outputs   ############

output "subnet_data" {
  value = data.aws_subnet_ids.db_subnet_available.ids
}

output "rds_address" {
  value = aws_db_instance.db_instance.address // endpoint of RDS //
}
