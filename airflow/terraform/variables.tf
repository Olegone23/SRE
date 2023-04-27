variable "aws_region" {
  description = "The AWS region where Terraform should deploy resources to"
  type        = string
}

variable "ami" {
  description = "AMI to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
}

variable "instance_count" {
  description = "How many EC2 Instances to add in Target Group"
  type        = number
}


variable "root_ebs_size" {
  description = "The size of the root device attached to EC2"
  default = 8
}

variable "iam_role" {
  description = "The IAM role attached to EC2"
  type = string
}

variable "tags" {
  description = "AWS tags to be applied on resources"
  type = map(string)
  default = {
    "appId"          = "Airflow"
    "appCode"        = "Airflow-01"
    "functionalArea" = "only for test"
    "ServiceEnvName" = "test"
    "EnvName"        = "non-prod"
    "Function"       = "dockerhost"
    "AppID"          = "Airflow"
    "ManagedBy"      = "Terraform"
    "aws-backup"     = "no"
  }
}

variable "vpc_id" {
  description = "VPC where the terraform should be deployed to"
  type        = string
}

variable "subnet_ids" {
  description = "VPC subnets to use for EC2s"
  type = list(string)
}

variable "keyname" {
  description = "The SSH key to use for connecting to EC2s"
  type = string
}

variable "sg_alb_name" {
  description = "Then name of the security group used by docker hosts"
  type = string
}

variable "sg_ec2_name" {
  description = "Then name of the security group used by docker hosts"
  type = string
}

