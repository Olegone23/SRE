variable "vpc_name" {
  description = "VPC Name (DEV, QA, PROD, SHARED)"
  type        = "string"
}

variable "ami" {
  description = "AMI id - Specify either RHEL or CentOS"
  type = "string"
  default = "ami-***"
}

variable "instance_type" {
  description = "InstanceType"
  type = "string"
  default = "t3.small"
}

variable "instance_iam_role" {
  description = "IAM Role an EC2 instance is launched with"
  type = "string"
  default = "aws-nonprod-mobile-resource-ec2"
}

variable "key_name" {
  description = "pem key name to access instance"
  type = "string"
  default = "***"
}

variable "env_name" {
  description = "Application environment name"
  type = "string"
}

variable "system_name" {
  description = "System name (AppCat ID)"
  type = "string"
}

variable "application_name" {
  description = "Application name (AppCat ID)"
  type = "string"
  default = "***"
}

variable "instance_name" {
  description = "AWS Host name of the instance"
  type = "string"
  default = "***"
}

variable "app_id" {
  description = "ATLAS application ID, deprecated"
  type = "string"
}

variable "component_name" {
  description = "Component name of application"
  type = "string"
}

variable "group_owner" {
  description = "Group owner of application"
  type = "string"
  default = "***"
}

variable "owner" {
  type = "string"
  default = "DevOps"
}

variable "root_ebs_size" {
  description = "Size for root drive"
  type = "string"
  default = "20"
}

variable "root_ebs_volume_type" {
  description = "volume_type for root drive"
  type = "string"
  default = "gp2"
}

variable "software_ebs_device_name" {
  description = "device_name for software drive"
  type = "string"
  default = "/dev/sdf"
}

variable "software_ebs_volume_type" {
  description = "volume_type for software drive"
  type = "string"
  default = "gp2"
}

variable "software_ebs_size" {
  description = "Size for software drive"
  type = "string"
  default = "10"
}

variable "log_ebs_device_name" {
  description = "device_name for software drive"
  type = "string"
  default = "/dev/sdg"
}

variable "log_ebs_volume_type" {
  description = "volume_type for software drive"
  type = "string"
  default = "gp2"
}

variable "log_ebs_size" {
  description = "Size for software drive"
  type = "string"
  default = "20"
}

variable "storage_ebs_device_name" {
  description = "device_name for storage drive"
  type = "string"
  default = "/dev/sdh"
}

variable "storage_ebs_volume_type" {
  description = "volume_type for storage drive"
  type = "string"
  default = "gp2"
}

variable "storage_ebs_size" {
  description = "Size for storage drive"
  type = "string"
  default = "500"
}

variable "desired_capacity" {
  description = "ASG desired_capacity"
  default = 1
}

variable "min_size" {
  description = "ASG min_size"
  default = 1
}

variable "max_size" {
  description = "ASG min_size"
  default = 1
}

variable "proxy" {
  type = "string"
}

variable "password" {
  type = "string"
}

variable "domain_name" {
  type = "string"
  default = "aws.***.com"
}

variable "health_check_type" {
  description = "From where get health status result"
  type = "string"
  default = "EC2"
}

variable "health_check_grace_period" {
  description = "Interval for initial provisioning "
  default = 1500
}

variable "subnet_ids" {
  description = "A map of subnets by VPC name"
  type        = "map"
  default = {
    DEV    = ["subnet-", "subnet-"]
    QA     = ["subnet-", "subnet-"]
    PROD   = ["subnet-", "subnet-"]
    SHARED = ["subnet-", "subnet-"]
  }
}

variable "security_group_ids" {
  description = "A map of security groups by VPC name"
  type        = "map"
  default = {
    DEV    = "sg-"
    QA     = "sg-"
    PROD   = "sg-"
    SHARED = "sg-"
  }
}

variable "vpc_ids" {
  description = "A map of VPC Ids by VPC name"
  type        = "map"
  default = {
    DEV    = "vpc-"
    QA     = "vpc-"
    PROD   = "vpc-"
    SHARED = "vpc-"
  }
}
