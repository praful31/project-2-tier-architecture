#######     link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb       ######

resource "aws_lb" "load_bal" {
  name               = var.load_name
  internal           = false // means using external it is accessible by internet //
  load_balancer_type = var.load_bal_type
  security_groups    = [data.aws_security_group.db_security_group_available.id]   ### Access From data.tf File ###
  subnets            = data.aws_subnet_ids.db_subnet_available.ids                ### Access From data.tf File ###

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "UTA"
  }
}