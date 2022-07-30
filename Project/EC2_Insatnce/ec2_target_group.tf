#######     link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group       ######

resource "aws_lb_target_group" "tar_gp" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc_available.id
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }