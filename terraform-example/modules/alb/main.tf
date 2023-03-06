resource "aws_lb" "w_alb" {
  name = "w-private-app-${replace(var.env_name, "w", "")}-alb"
  internal = true
  load_balancer_type = "application"

  security_groups = [var.security_group_ids[var.vpc_name]]
  subnets = var.subnet_ids[var.vpc_name]

  enable_deletion_protection = true

  tags = {
    AppID = "APP-*****"
    AppName = "******"
    ServiceEnvName = var.env_name
    GroupOwner = "*********"
    ComponentName1 = "w-private-app-${replace(var.env_name, "w", "")}-alb"
    Terraform = true
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.w_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}
