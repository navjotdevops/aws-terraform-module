variable "DEPLOY" {
  default     = 0
  description = "Variable to select whether to deploy this module or not, allowed value is 0 or 1"
}

variable "ALB_NAME" {
  description = "Application Load Balancer Name"
}

variable "IS_INTERNAL" {
  description = "Is Application Load Balancer Internal? Means only accessable using internal IP, allowed value is true or false"
}

variable "SECURITY_GROUPS" {}

variable "SUBNETS" {}

variable "IS_PROTECTED" {}

variable "ADDR_TYPE" {}

variable "LOG_BUCKET" {}

variable "BUCKET_PREFIX" {}

variable "IS_LOG_ENABLED" {}

variable "OWNER" {}

variable "ENV" {}

variable "IDLE_TIMEOUT" {}

