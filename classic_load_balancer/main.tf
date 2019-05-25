resource "aws_elb" "classic_elb" {
  count                       = "${var.DEPLOY}"
  name                        = "${lower(var.CLASSIC_ELB_NAME)}-${lower(var.ENV)}"
  cross_zone_load_balancing   = true
  idle_timeout                = "${var.CLASSIC_ELB_IDLE_TIMEOUT}"
  connection_draining         = true
  connection_draining_timeout = 5
  security_groups             = ["${var.SECURITY_GROUPS}"]
  subnets                     = ["${split(",", var.SUBNETS)}"]
  internal                    = "${var.IS_INTERNAL}"

  access_logs {
    bucket        = "${lower(var.ELB_LOG_BUCKET)}"
    bucket_prefix = "${lower(var.ELB_LOG_BUCKET_PREFIX)}"
    interval      = 60
    enabled       = true
  }

  listener {
    instance_port      = "${var.INSTANCE_PORT}"
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.CERTIFICATE_ARN}"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "${var.HEALTH_CHECK_TARGET}"
    interval            = 30
  }

  tags {
    Name        = "${lower(var.CLASSIC_ELB_NAME)}-${lower(var.ENV)}"
    Environment = "${lower(var.ENV)}"
    Owner       = "${lower(var.OWNER)}"
  }
}
