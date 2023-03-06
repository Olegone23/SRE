variable "env_name" {
  description = "Application environment name"
  type = "string"
}

variable "vpc_name" {
  description = "VPC Name (DEV, QA, PROD, SHARED)"
  type        = "string"
}

variable "vpc_ids" {
  description = "A map of VPC Ids by VPC name"
  type        = "map"
  default = {
    DEV    = "vpc-*******"
    QA     = "vpc-*******"
    PROD   = "vpc-*******"
    SHARED = "vpc-*******"
  }
}

variable "subnet_ids" {
  description = "A map of subnets by VPC name"
  type        = "map"
  default = {
    DEV    = ["subnet-******", "subnet-*****"]
    QA     = ["subnet-******", "subnet-*****"]
    PROD   = ["subnet-******", "subnet-*****"]
    SHARED = ["subnet-******", "subnet-*****"]
  }
}

variable "security_group_ids" {
  description = "A map of security groups by VPC name"
  type        = "map"
  default = {
    DEV    = "sg-***"
    QA     = "sg-***"
    PROD   = "sg-***"
    SHARED = "sg-***"
  }
}

variable "tg_deregistration_delay" {
  description = "tg_deregistration_delay"
  type = "string"
  default = "10"
}

variable "tg_hc_path" {
  description = "Health check path"
  type = "string"
  default = "/service/health"
}

variable "tg_hc_healthy_threshold" {
  description = "tg_healthy_threshold"
  type = "string"
  default = "4"
}

variable "tg_hc_unhealthy_threshold" {
  description = "tg_unhealthy_threshold"
  type = "string"
  default = "2"
}

variable "tg_hc_timeout" {
  description = "tg_timeout"
  type = "string"
  default = "5"
}

variable "tg_hc_interval" {
  description = "tg_hc_interval"
  type = "string"
  default = "10"
}

variable "tg_hc_matcher" {
  description = "tg_matcher"
  type = "string"
  default = "200"
}

variable "app_ins_port" {
  description = "Application instance port"
  type = "string"
  default = "9000"
}

variable "app_ins_protocol" {
  description = "Application instance protocol"
  type = "string"
  default = "HTTP"
}
