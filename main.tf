terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_launch_template" "example" {
  name = var.lc_name
  image_id = var.ami_id
  instance_initiated_shutdown_behavior = "terminate"
  key_name = var.key_name // !!  
  instance_type = "t2.micro"
  user_data = filebase64("user_data_MHDDoS.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Laurel-server"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "Laurel-server"
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      Name = "Laurel-server"
    }
  }
}

resource "aws_autoscaling_group" "example" {
  name = var.asg_name
  capacity_rebalance  = true
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.vpc_zone
  health_check_grace_period = 180
  launch_template {
    id      = aws_launch_template.example.id
    version = aws_launch_template.example.latest_version
  }
}