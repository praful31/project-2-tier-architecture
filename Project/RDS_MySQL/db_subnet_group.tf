### Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group ###

resource "aws_db_subnet_group" "db_sub_group" {
  name       = "main"
  subnet_ids = data.aws_subnet_ids.db_subnet_available.ids         ####//ids = for access multiple subnets //

  tags = {
    Name = "My DB subnet group"
  }
}
