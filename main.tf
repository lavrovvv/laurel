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
}

resource "aws_launch_template" "example" {
  name = var.lc_name
  image_id = var.ami_id
  instance_initiated_shutdown_behavior = "terminate"
  key_name = var.key_name // !!  
  instance_type = "t2.micro"
  # network_interfaces {
  #   associate_public_ip_address = true
  #   security_groups = var.security_groups
  # }
  user_data = filebase64("user_data.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "DDoS"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "DDoS"
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      Name = "DDoS"
    }
  }
  // block_device_mappings {
  //   device_name = "/dev/sda1"
  //   ebs {
  //     volume_type = "gp3"
  //     volume_size = "8"
  //     delete_on_termination = "true"
  //   }
  // }
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