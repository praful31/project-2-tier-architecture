
##########    VPC     ############## Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  instance_tenancy     = "default"

  tags = {
    Name = "${var.tag}vpc_name_tag"
  }
}


##########    PUBLIC SUBNET     ##############  Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet 

resource "aws_subnet" "public_sub_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnets_cidr_1
  availability_zone = data.aws_availability_zones.aws_avz.names[0]    ### Access From data.tf File ###
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch #### Convert subnet into public subnet by using map function value it will be true ###

  tags = {
    Name = "${var.tag}public_sub_1_tag"
  }
}

resource "aws_subnet" "public_sub_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnets_cidr_2
  availability_zone = data.aws_availability_zones.aws_avz.names[1]
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch #### Convert subnet into public subnet by using map function value it will be true and bool required  ###

  tags = {
    Name = "${var.tag}public_sub_2_tag"
  }
}


##########    PRIVATE SUBNET (DATABASE)    ##############   Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "private_sub_db_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_sub_db_cidr_1
  availability_zone = data.aws_availability_zones.aws_avz.names[0]     ### Access From data.tf File ###
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.tag}private_sub_db_1_tag"
  }
}

resource "aws_subnet" "private_sub_db_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_sub_db_cidr_2
  availability_zone = data.aws_availability_zones.aws_avz.names[1]
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.tag}private_sub_db_2_tag"
  }
}


##########    INTERNET GATEWAY     ##############   Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.tag}igw_name_tag"
  }
}


##########   PUBLIC ROUTES TABLE   ##############  Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table         

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "${var.tag}pub_route_table_tag"
  }
}


##########    ROUTES TABLE  FOR DATABSE  ##############

resource "aws_route_table" "private_rt_for_db" {
  vpc_id = aws_vpc.my_vpc.id

  #   route = []

  #   resource "aws_route" "private" {
  #   route_table_id            = aws_route_table.private_rt_for_db.id
  #   destination_cidr_block    = "0.0.0.0/0"
  #   ##vpc_peering_connection_id = "pcx-45ff3dc1"
  #   depends_on                = [aws_route_table.private_rt_for_db]
  # }

  tags = {
    Name = "${var.tag}private_for_db_tag"
  }
}


##########    ROUTES TABLE  ASSOCIATE WITH SUBNETS  ##############    Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "pub_rt_asso_1" {
  subnet_id      = aws_subnet.public_sub_1.id
  route_table_id = aws_route_table.pub_route_table.id
}
resource "aws_route_table_association" "pub_rt_asso_2" {
  subnet_id      = aws_subnet.public_sub_2.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "pvt_db_rt_asso_1" {
  subnet_id      = aws_subnet.private_sub_db_1.id
  route_table_id = aws_route_table.private_rt_for_db.id
}
resource "aws_route_table_association" "pvt_db_rt_asso_2" {
  subnet_id      = aws_subnet.private_sub_db_2.id
  route_table_id = aws_route_table.private_rt_for_db.id
}

