### Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance ###

resource "aws_db_instance" "db_instance" {
  allocated_storage      = 20
  engine                 = var.engine_name
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.db_name
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.db_sub_group.id
  skip_final_snapshot    = true
  vpc_security_group_ids = [data.aws_security_group.db_security_group_available.id] ### // vpc security group is denfine in [] //

}
