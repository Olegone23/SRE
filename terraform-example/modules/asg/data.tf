data "aws_lb_target_group" "default_tg" {
  name = "*******-default-${replace(var.env_name, "w", "")}-tg"
}

data "aws_lb_target_group" "app_tg" {
  name = "*******-app-${replace(var.env_name, "w", "")}-tg"
}

data "aws_lb_target_group" "dashboard_tg" {
  name = "*******-dashboard-${replace(var.env_name, "w", "")}-tg"
}
