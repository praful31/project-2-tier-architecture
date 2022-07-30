#############   Link = https://www.terraform.io/language/values/outputs   ############

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}