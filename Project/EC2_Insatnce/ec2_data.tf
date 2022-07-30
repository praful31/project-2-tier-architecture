#####     Fetch VPC Id for Fetch Subnets Under that VPC #####

data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["vpc_name_tag"]
  }
}



#####    After fetching VPC Now For Subnets  #####

data "aws_subnet_ids" "db_subnet_available" {
  vpc_id = data.aws_vpc.vpc_available.id
  filter {
    name   = "tag:Name"
    values = ["private_sub_db*"] // * = all subnets acceess who started with private_sub_db //
  }
}

#####   To Access Security Group Data   #####
data "aws_security_group" "db_security_group_available" {
  filter {
    name   = "tag:Name"
    values = ["SecurityGroup"]
  }
}

###### To Fetch User data from  ######   (template_file = Used for Access the contend of any file)
data "template_file" "user_data" {
  template = file("./ec2_user_data.sh")
}