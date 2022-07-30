#######        Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group     ########

resource "aws_autoscaling_group" "auto_scl_gp" {
  name                      = "auto_scalling_group"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  #force_delete              = true
  #placement_group           = aws_placement_group.test.id
  launch_configuration = aws_launch_configuration.ec2_conf.name
  vpc_zone_identifier  = data.aws_subnet_ids.db_subnet_available.ids
  target_group_arns    = [aws_lb_target_group.tar_gp.arn]

  tag {
    key                 = "Name"
    value               = "tomcat_app_server"
    propagate_at_launch = true
  }

  depends_on = [               ##### First Run Target Group then Run auto_scalling_group that's way use depends_on  #####
    aws_lb_target_group.tar_gp ##### Because the information of target_group_arns are fill in auto_scalling_group.tf file ######
  ]
}