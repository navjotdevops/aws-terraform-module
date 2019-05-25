variable "DEPLOY" {
  default = ""
}

variable "CLASSIC_ELB_NAME" {}

variable "CLASSIC_ELB_IDLE_TIMEOUT" {}

variable "SECURITY_GROUPS" {}

variable "SUBNETS" {}

variable "IS_INTERNAL" {}

variable "ELB_LOG_BUCKET" {}

variable "ELB_LOG_BUCKET_PREFIX" {}

variable "INSTANCE_PORT" {}

variable "CERTIFICATE_ARN" {}

variable "HEALTH_CHECK_TARGET" {
  default = ""
}

variable "ENV" {}

variable "OWNER" {}
