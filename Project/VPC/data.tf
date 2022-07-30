########    Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones    ##########

# Declare the data source 
########   used for Availability Zones List Out ########## Only show Avilable Zones #####
data "aws_availability_zones" "aws_avz" {
  state = "available"
}