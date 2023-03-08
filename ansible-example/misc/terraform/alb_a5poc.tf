resource "aws_lb" "alb_ghpoc" {
  name               = "gh-private-ga-app-ghpoc-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["sg-***"]
  subnets            = ["subnet-***", "subnet-***"]

  enable_deletion_protection = true

  tags = {
    AppID = "APP-5158"
    ComponentName1 = "gh-private-ga-app-ghpoc-alb"
    ComponentName2 = "gh-course-setup-ghpoc"
  }
}

resource "aws_lb_listener" "ghpoc_listener" {
  load_balancer_arn = "${aws_lb.alb_ghpoc.arn}"
  port              = "80"
  protocol          = "HTTP"

default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-ghpoc-ga.arn}"
  }
}

resource "aws_lb_listener" "ghpoc_https_listener" {
  load_balancer_arn = "${aws_lb.alb_ghpoc.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:***:certificate/80c0f63f-9b9c-4453-a86a-886170bdb07d"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-ghpoc-course-setup.arn}"
  }
}