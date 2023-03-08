resource "aws_lb_target_group" "tg-ghpoc-ga" {
  name     = "gh-ga-ghpoc-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-course-setup" {
  name     = "gh-ga-course-setup-ghpoc-tg"
  port     = 8061
  protocol = "HTTP"
  vpc_id   = "vpc-***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/courses/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-announcements" {
  name     = "gh-ga-announcements-ghpoc-tg"
  port     = 8152
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/announcements/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-auth" {
  name     = "gh-ga-auth-ghpoc-tg"
  port     = 8011
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/auth/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-auth-service" {
  name     = "gh-ga-auth-service-ghpoc-tg"
  port     = 8141
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/casauth/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-canvas" {
  name     = "gh-ga-canvas-ghpoc-tg"
  port     = 8151
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/canvas-gateway/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-css" {
  name     = "gh-ga-ccs-ghpoc-tg"
  port     = 8153
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/ccs/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-content" {
  name     = "gh-ga-content-ghpoc-tg"
  port     = 8031
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/content/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-courses" {
  name     = "gh-ga-courses-ghpoc-tg"
  port     = 8161
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v2/courses/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-event-service" {
  name     = "gh-ga-event-service-ghpoc-tg"
  port     = 8076
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/event/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-e4sync" {
  name     = "gh-ga-e4sync-ghpoc-tg"
  port     = 8111
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/e4sync/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-lti" {
  name     = "gh-ga-lti-ghpoc-tg"
  port     = 8091
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/lti/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-meta" {
  name     = "gh-ga-meta-ghpoc-tg"
  port     = 8021
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/meta/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-notifications" {
  name     = "gh-ga-notifications-ghpoc-tg"
  port     = 8131
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/notifications/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-outcome-service" {
  name     = "gh-ga-outcome-service-ghpoc-tg"
  port     = 8075
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/outcomes/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-search" {
  name     = "gh-ga-search-ghpoc-tg"
  port     = 8101
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/search/version"
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}

resource "aws_lb_target_group" "tg-ghpoc-sso" {
  name     = "gh-ga-sso-ghpoc-tg"
  port     = 8121
  protocol = "HTTP"
  vpc_id   = "***"
  deregistration_delay = 10
  health_check {
    path = "/gh/api/v1/sso/version"
    healthy_threshold = 4
    unhealthy_threshold = 2
    matcher = 200
    timeout = 5
    interval = 10
  }
}