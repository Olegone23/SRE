resource "aws_lb_listener_rule" "app" {
  listener_arn = aws_lb_listener.http_listener.arn

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }

  condition {
    field = "host-header"
    values = [
      "mcs.${replace(var.env_name, "w", "")}.*******.com"
    ]
  }
}

resource "aws_lb_listener_rule" "dashboard" {
  listener_arn = aws_lb_listener.http_listener.arn

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.dashboard_tg.arn
  }

  condition {
    field = "host-header"
    values = [
      "cms.${replace(var.env_name, "w", "")}.*******.com"
    ]
  }
}
