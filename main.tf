module "app_load_balancer" {
  source = "./application_load_balancer"

  DEPLOY          = "${var.DEPLOY_ALB}"
  alb_name        = "applicationloadbalancer"
  is_internal     = "${var.IS_ALB_ELB_INTERNAL}"
  security_groups = "${var.ALB_SECURITY_GROUP_ID}"
  subnets         = "${var.ALB_SUBNET_ID}"
  is_protected    = false
  addr_type       = "ipv4"
  log_bucket      = "${var.ELB_LOG_BUCKET}"
  bucket_prefix   = "alb"
  is_log_enabled  = true
  ENV             = "${var.ENV}"
  OWNER           = "${var.OWNER}"
  idle_timeout    = 180
}

module "classic_elb" {
  source = "./classic_load_balancer"

  DEPLOY                   = "${var.DEPLOY_CLASSIC_ELB}"
  CLASSIC_ELB_NAME         = "classic-elb"
  CLASSIC_ELB_IDLE_TIMEOUT = 60
  SECURITY_GROUPS          = "${var.CLASSIC_SECURITY_GROUP_ID}"
  SUBNETS                  = "${var.CLASSIC_SUBNET_ID}"
  IS_INTERNAL              = "${var.IS_CLASSIC_ELB_INTERNAL}"
  ELB_LOG_BUCKET           = "${var.ELB_LOG_BUCKET}"
  ELB_LOG_BUCKET_PREFIX    = "classic-elb"
  INSTANCE_PORT            = "${var.CLASSIC_PORT}"
  CERTIFICATE_ARN          = "${var.PUBLIC_CERTIFICATE_ARN}"
  HEALTH_CHECK_TARGET      = "TCP:${var.CLASSIC_PORT}"
  ENV                      = "${var.ENV}"
  OWNER                    = "${var.OWNER}"
}
