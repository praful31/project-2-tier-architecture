############    Link = https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration     ###########

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "ec2_conf" {
  name                        = "web_config"
  image_id                    = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "key_demo"
  associate_public_ip_address = true
  security_groups             = [data.aws_security_group.db_security_group_available.id]
  user_data                   = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}
#### Create a Both Key Public Key and Private Key #####

resource "tls_private_key" "gen_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

### To Attach PublicKey to EC2 Instance Crated By Own On Ubuntu ##### 
resource "aws_key_pair" "key" {
  key_name   = "key_demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAd/+XeqMuurPnVNhbn/IkYHdy90NRS/0OXP1VZFDSe6PO/ddc+sJmTzYW0JStI1FcD/F+7hyLbrVNQLs3jvX97vdsLGHCO1A3TepmON4GfHQHXDKx1m1vowezGLZPOB7cMpcToXFgFWWMytdmUB8uJKJFxMLwXRnEAlEfzi4c5Rx4AYsqRilt/QiYQiKk6NMLDQmY6eBhwffN+9W2zSYsV8uUhUbTKIPQRM3YMMkEJJvXXvpEdbIh+EjgH05D947P5gUiD3rVnST4onlcbOb7xyQNiqyyT4F/r4NLojrQfxcmtlHttVbKqRpSGM1gFEXRIWFtWUYHDt7tZqy7EVhv root@DESKTOP-MHQMU53"
}