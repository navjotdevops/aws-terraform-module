resource "aws_alb" "alb" {
  count                      = "${var.DEPLOY}"
  name                       = "${var.ALB_NAME}-${lower(var.ENV)}"
  internal                   = "${var.IS_INTERNAL}"
  security_groups            = ["${var.SECURITY_GROUPS}"]
  subnets                    = ["${split(",", var.SUBNETS)}"]
  idle_timeout               = "${var.IDLE_TIMEOUT}"
  enable_deletion_protection = "${var.IS_PROTECTED}"
  ip_address_type            = "${var.ADDR_TYPE}"

  access_logs {
    bucket  = "${lower(var.LOG_BUCKET)}"
    prefix  = "${lower(var.BUCKET_PREFIX)}"
    enabled = "${var.IS_LOG_ENABLED}"
  }

  tags {
    Name        = "${lower(var.ALB_NAME)}-${lower(var.ENV)}"
    Environment = "${lower(var.ENV)}"
    Owner       = "${lower(var.OWNER)}"
  }
}
