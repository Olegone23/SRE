module "******_httpd" {
  source = "../../../../modules/httpd_asg"

  component_name = var.component_name_httpd
  instance_name = var.instance_name_httpd
  instance_iam_role = var.instance_iam_role
  system_name = var.system_name
  app_id = var.app_id
  env_name = var.env_name
  vpc_name = var.vpc_name
  proxy = var.proxy
  password = var.password
  elb_sandwich_lb_name = var.elb_sandwich_lb_name
}

module "******_app" {
  source = "../../../../modules/asg"

  component_name = var.component_name_app
  instance_name = var.instance_name_app
  instance_type = var.app_instance_type
  instance_iam_role = var.instance_iam_role
  storage_ebs_size = 500
  system_name = var.system_name
  app_id = var.app_id
  env_name = var.env_name
  vpc_name = var.vpc_name
  proxy = var.proxy
  password = var.password
}

module "******_dashboard" {
  source = "../../../../modules/asg"

  component_name = var.component_name_dashboard
  instance_name = var.instance_name_dashboard
  instance_type = var.storage_instance_type
  instance_iam_role = var.instance_iam_role
  storage_ebs_size = 500
  system_name = var.system_name
  app_id = var.app_id
  env_name = var.env_name
  vpc_name = var.vpc_name
  proxy = var.proxy
  password = var.password
}

module "******_storage" {
  source = "../../../../modules/asg"

  component_name = var.component_name_storage
  instance_name = var.instance_name_storage
  instance_type = var.storage_instance_type
  instance_iam_role = var.instance_iam_role
  storage_ebs_size = 1000
  system_name = var.system_name
  app_id = var.app_id
  env_name = var.env_name
  vpc_name = var.vpc_name
  proxy = var.proxy
  password = var.password
}

module "******_monitoring" {
  source = "../../../../modules/asg"

  component_name = var.component_name_monitoring
  instance_name = var.instance_name_monitoring
  instance_type = var.storage_instance_type
  instance_iam_role = var.instance_iam_role
  storage_ebs_size = 500
  system_name = var.system_name
  app_id = var.app_id
  env_name = var.env_name
  vpc_name = var.vpc_name
  proxy = var.proxy
  password = var.password
}

resource "aws_s3_bucket" "******_storage_private" {
  bucket = var.s3_storage_private_bucket_name
  acl    = "private"

  tags = var.global_tags
}

resource "aws_s3_bucket" "*******_cache_private" {
  bucket = var.s3_cache_private_bucket_name
  acl    = "private"

  tags = var.global_tags
}

resource "aws_s3_bucket" "*******_public" {
  bucket = var.s3_public_bucket_name
  acl    = "public-read"

  tags = var.global_tags
}

