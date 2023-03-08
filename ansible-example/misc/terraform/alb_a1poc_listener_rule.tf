resource "aws_lb_listener_rule" "e4sync_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-e4sync.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/e4sync*"]
  }
}

resource "aws_lb_listener_rule" "event_service_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-event-service.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/event*"]
  }
}

resource "aws_lb_listener_rule" "outcome_service_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-outcome-service.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/outcome*"]
  }
}

resource "aws_lb_listener_rule" "lti_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-lti.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/lti*"]
  }
}

resource "aws_lb_listener_rule" "search_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-search.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/search*"]
  }
}

resource "aws_lb_listener_rule" "auth_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-auth.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/auth*"]
  }
}

resource "aws_lb_listener_rule" "auth_service_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-auth-service.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/casauth*"]
  }
}

resource "aws_lb_listener_rule" "sso_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-sso.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/sso*"]
  }
}

resource "aws_lb_listener_rule" "canvas_gateway_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-canvas.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/canvas-gateway*"]
  }
}

resource "aws_lb_listener_rule" "announcements_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-announcements.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/announcements*"]
  }
}

resource "aws_lb_listener_rule" "css_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-css.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/ccs/*"]
  }
}

resource "aws_lb_listener_rule" "notifications_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-notifications.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/notifications*"]
  }
}

resource "aws_lb_listener_rule" "notifications_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-notifications.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/notifications*"]
  }
}

resource "aws_lb_listener_rule" "meta_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-meta.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/meta*"]
  }
}

resource "aws_lb_listener_rule" "meta_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-meta.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/meta*"]
  }
}

resource "aws_lb_listener_rule" "lmscourses_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-courses.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/lmscourses*"]
  }
}

resource "aws_lb_listener_rule" "courses_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-courses.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/courses*"]
  }
}

resource "aws_lb_listener_rule" "sections_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-courses.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/sections*"]
  }
}

resource "aws_lb_listener_rule" "lmssections_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-courses.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/lmssections*"]
  }
}

resource "aws_lb_listener_rule" "enrollments_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/enrollments*"]
  }
}

resource "aws_lb_listener_rule" "consumers_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/consumers*"]
  }
}

resource "aws_lb_listener_rule" "secure_consumers_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/consumers*"]
  }
}

resource "aws_lb_listener_rule" "users_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/users*"]
  }
}

resource "aws_lb_listener_rule" "users_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/users*"]
  }
}

resource "aws_lb_listener_rule" "secure_users_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/users*"]
  }
}

resource "aws_lb_listener_rule" "lmsusers_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/lmsusers*"]
  }
}

resource "aws_lb_listener_rule" "userprofiles_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/userprofiles*"]
  }
}

resource "aws_lb_listener_rule" "secure_userprofiles_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/userprofiles*"]
  }
}

resource "aws_lb_listener_rule" "lmscoursesections_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/lmscoursesections*"]
  }
}

resource "aws_lb_listener_rule" "lmscourses_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/lmscourses*"]
  }
}

resource "aws_lb_listener_rule" "institutions_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/institutions*"]
  }
}

resource "aws_lb_listener_rule" "institutions_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/institutions*"]
  }
}

resource "aws_lb_listener_rule" "coursesections_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/coursesections*"]
  }
}

resource "aws_lb_listener_rule" "coursesections_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/coursesections*"]
  }
}

resource "aws_lb_listener_rule" "secure_coursesections_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/coursesections*"]
  }
}

resource "aws_lb_listener_rule" "courses_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/courses*"]
  }
}

resource "aws_lb_listener_rule" "secure_courses_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/courses*"]
  }
}

resource "aws_lb_listener_rule" "license_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = [ "/gh/api/v1/license*"]
  }
}

resource "aws_lb_listener_rule" "secure_license_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/license*"]
  }
}

resource "aws_lb_listener_rule" "ecommerce_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/ecommerce*"]
  }
}

resource "aws_lb_listener_rule" "secure_ecommerce_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/ecommerce*"]
  }
}

resource "aws_lb_listener_rule" "products_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/products*"]
  }
}

resource "aws_lb_listener_rule" "vitalsource_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/vitalsource*"]
  }
}

resource "aws_lb_listener_rule" "secure_vitalsource_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/vitalsource*"]
  }
}

resource "aws_lb_listener_rule" "secure_announcements_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/announcements*"]
  }
}

resource "aws_lb_listener_rule" "lmsapiprovider_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/lmsapiprovider*"]
  }
}

resource "aws_lb_listener_rule" "adminuser_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/secure/adminuser*"]
  }
}

resource "aws_lb_listener_rule" "cap_v1_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/cap*"]
  }
}

resource "aws_lb_listener_rule" "cap_v2_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-course-setup.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v2/cap*"]
  }
}

resource "aws_lb_listener_rule" "css_https_a1poc" {
  listener_arn = "${aws_lb_listener.a1poc_https_listener.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-a1poc-css.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/gh/api/v1/ccs/*"]
  }
}