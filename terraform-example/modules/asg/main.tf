resource "aws_launch_configuration" "app_lc" {
  name_prefix = "*******-${replace(var.env_name, "w", "")}-launch-config-"
  image_id = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.instance_iam_role
  security_groups = [var.security_group_ids[var.vpc_name]]
  key_name = var.key_name
  user_data = templatefile("${path.module}/files/user-data.tpl",
  {
    vpc_name_lc = lower(var.vpc_name)
    env_name = var.env_name
    cloud = var.vpc_name == "prod" ? "prod" : "nonprod"
    proxy = var.proxy
    component_name = var.component_name
    domain_name = var.domain_name
    system_name = lower(var.system_name)
    password = var.password
  })

  root_block_device {
    volume_size = var.root_ebs_size
    volume_type = var.root_ebs_volume_type
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = var.software_ebs_device_name
    volume_type = var.software_ebs_volume_type
    volume_size = var.software_ebs_size
    encrypted = true
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = var.log_ebs_device_name
    volume_type = var.log_ebs_volume_type
    volume_size = var.log_ebs_size
    encrypted = true
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = var.storage_ebs_device_name
    volume_type = var.storage_ebs_volume_type
    volume_size = var.storage_ebs_size
    encrypted = true
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity = var.desired_capacity
  max_size = var.max_size
  min_size = var.min_size
  vpc_zone_identifier = var.subnet_ids[var.vpc_name]
  launch_configuration = aws_launch_configuration.app_lc.name
  target_group_arns = [
    var.component_name == "*******-app" ? data.aws_lb_target_group.app_tg.arn :
    var.component_name == "*******-dashboard" ? data.aws_lb_target_group.dashboard_tg.arn : data.aws_lb_target_group.default_tg.arn
  ]
  health_check_type = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  tags = [
    {
      key = "Name"
      value = var.instance_name
      propagate_at_launch = true
    },
    {
      key = "Image_Id"
      value = var.ami
      propagate_at_launch = true
    },
    {
      key = "VPC"
      value = var.vpc_name
      propagate_at_launch = true
    },
    {
      key = "SystemName"
      value = var.system_name
      propagate_at_launch = true
    },
    {
      key = "ApplicationName"
      value = var.application_name
      propagate_at_launch = true
    },
    {
      key = "AppID"
      value = var.app_id
      propagate_at_launch = true
    },
    {
      key = "ServiceName"
      value = var.component_name
      propagate_at_launch = true
    },
    {
      key = "GroupOwner"
      value = var.group_owner
      propagate_at_launch = true
    },
    {
      key = "Owner"
      value = var.owner
      propagate_at_launch = true
    },
    {
      key = "ServiceEnvName"
      value = var.env_name
      propagate_at_launch = true
    },
    {
      key = "Terraform"
      value = true
      propagate_at_launch = true
    }
  ]
}

