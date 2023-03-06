resource "aws_lb_target_group" "default_tg" {
  name = "*******-default-${replace(var.env_name, "w", "")}-tg"
  port = var.app_ins_port
  protocol = var.app_ins_protocol
  vpc_id = var.vpc_ids[var.vpc_name]
  deregistration_delay = var.tg_deregistration_delay
  health_check {
    path = "/"
    healthy_threshold = var.tg_hc_healthy_threshold
    unhealthy_threshold = var.tg_hc_unhealthy_threshold
    timeout = var.tg_hc_timeout
    interval = var.tg_hc_interval
    matcher = var.tg_hc_matcher
  }
}

resource "aws_lb_target_group" "app_tg" {
  name = "*******-app-${replace(var.env_name, "w", "")}-tg"
  port = var.app_ins_port
  protocol = var.app_ins_protocol
  vpc_id = var.vpc_ids[var.vpc_name]
  deregistration_delay = var.tg_deregistration_delay
  health_check {
    path = var.tg_hc_path
    healthy_threshold = var.tg_hc_healthy_threshold
    unhealthy_threshold = var.tg_hc_unhealthy_threshold
    timeout = var.tg_hc_timeout
    interval = var.tg_hc_interval
    matcher = var.tg_hc_matcher
  }
}

resource "aws_lb_target_group" "dashboard_tg" {
  name = "*******-dashboard-${replace(var.env_name, "w", "")}-tg"
  port = var.app_ins_port
  protocol = var.app_ins_protocol
  vpc_id = var.vpc_ids[var.vpc_name]
  deregistration_delay = var.tg_deregistration_delay
  health_check {
    path = var.tg_hc_path
    healthy_threshold = var.tg_hc_healthy_threshold
    unhealthy_threshold = var.tg_hc_unhealthy_threshold
    timeout = var.tg_hc_timeout
    interval = var.tg_hc_interval
    matcher = var.tg_hc_matcher
  }
}

resource "aws_lb_target_group" "dashboard_tg" {
  name = "*******-storage-${replace(var.env_name, "w", "")}-tg"
  port = var.app_ins_port
  protocol = var.app_ins_protocol
  vpc_id = var.vpc_ids[var.vpc_name]
  deregistration_delay = var.tg_deregistration_delay
  health_check {
    path = var.tg_hc_path
    healthy_threshold = var.tg_hc_healthy_threshold
    unhealthy_threshold = var.tg_hc_unhealthy_threshold
    timeout = var.tg_hc_timeout
    interval = var.tg_hc_interval
    matcher = var.tg_hc_matcher
  }
}
