variable "aws_access_key" {}
variable "aws_secret_key" {}

#-------------------------------------------------
# VPC vars
#-------------------------------------------------
variable vpc_id {
  default = "vpc-**************"
}

variable vpc_name {
  default = "QA"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "db_availability_zones" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "subnet_ids" {
  description = "A list for subnets"
  type = list(string)
  default = [
    "subnet-*********",
    "subnet-*********"
  ]
}

variable "app_security_groups_ids" {
  description = "A list for security groups for app instances"
  type = list(string)
  default = [
    "sg-********",
    "sg-********"
  ]
}

variable "db_security_groups_ids" {
  description = "A list for security groups for ALB"
  type = list(string)
  default = [
    "sg-*******"
  ]
}

variable "lb_security_groups_ids" {
  description = "A list for security groups for ALB"
  type = list(string)
  default = [
    "sg-*******"
  ]
}

variable "proxy" {
  type = "string"
  default = "http://proxy-().com"
}

variable "password" {}

#-------------------------------------------------
# EC2's vars
#-------------------------------------------------
variable "ec2_ami" {
  default = "ami-**************8"
}

variable "instance_iam_role" {
  default = "aws-nonprod-mobile-resource-ec2"
}

variable "app_ws_instance_type" {
  default = "c4.2xlarge"
}

variable "app_instance_type" {
  default = "r5.xlarge"
}

variable "storage_instance_type" {
  default = "r5.large"
}

variable "ebs_volume_type" {
  default = "gp2"
}

variable "elb_sandwich_lb_name" {
  default = "*************-elb-30173"
}

variable "key_name" {
  default = "*************"
}

variable "system_name" {
  default = "************"
}

variable "app_id" {
  default = "APP-****"
}

variable "env_name" {
  default = "****"
}

variable "component_name_httpd" {
  default = "******"
}

variable "instance_name_httpd" {
  default = "******"
}

variable "component_name_app" {
  default = "********"
}

variable "instance_name_app" {
  default = "*********"
}

variable "component_name_dashboard" {
  default = "*******-dashboard"
}

variable "instance_name_dashboard" {
  default = "********"
}

variable "component_name_storage" {
  default = "j*******-storage"
}

variable "instance_name_storage" {
  default = "aue1lujasA04"
}

variable "component_name_monitoring" {
  default = "j*******-monitoring"
}

variable "instance_name_monitoring" {
  default = "***********"
}

#-------------------------------------------------
# App
#-------------------------------------------------

variable "app_port" {
  default = "9000"
}

#-------------------------------------------------
# S3
#-------------------------------------------------

variable "s3_storage_private_bucket_name" {
  default = "aws-nonprod-j*******-*******-storage-private"
}

variable "s3_cache_private_bucket_name" {
  default = "aws-nonprod-j*******-*******-cache-private"
}

variable "s3_public_bucket_name" {
  default = "aws-nonprod-j*******-*******-public"
}

#-------------------------------------------------
# DocumentDB
#-------------------------------------------------
variable "db_port" {
  default = "27017"
}

variable db_cluster_name {
  default = "j*******-*******"
}

variable "db_instance_type" {
  default = "db.r4.xlarge"
}

variable "db_instance_count" {
  default = "2"
}

variable "db_subnet_name" {
  default = "rds-nonprod-qa-sg"
}

variable "db_parameter_group_family" {
  default = "docdb3.6"
}

variable "db_parameter_group_name" {
  default = "default"
}

variable "db_parameter_group_description" {
  default = "docdb cluster parameter group"
}

#-------------------------------------------------
# ElasticSearch vars
#-------------------------------------------------
variable "es_******_*******_domain" {
  default = "*******-*******"
}

variable "es_*******_*******_sg_id" {
  default = "sg-f6bf698e"
}

variable "es_*******_*******_subnet_id" {
  default = "subnet-2708de0d"
}

variable "es_*******_*******_instance_type" {
  default = "r4.xlarge.elasticsearch"
}

variable "es_*******_*******_instance_count" {
  default = "3"
}

variable "es_*******_*******_volume_size" {
  default = "1000"
}

variable "es_*******_*******_iversion" {
  default = "6.3"
}

variable "es_*******_*******_automated_snapshot_start_hour" {
  default = "23"
}

#-------------------------------------------------
# Tags
#-------------------------------------------------
variable "global_tags" {
  description = "AWS tags that will be added to all resources managed herein"
  type = map(string)
  default = {
    "Project" = "********"
    "AppID" = "APP-*****"
    "AppName" = "**********"
    "GroupOwner" = "************"
    "Owner" = "DevOps Team"
    "ManagedBy" = "Terraform"
    "Function" = "*******"
    "Environment" = "*******"
    "ServiceEnvName" = "*******"
  }
}
