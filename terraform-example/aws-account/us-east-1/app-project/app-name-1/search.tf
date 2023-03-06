data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_elasticsearch_domain" "*******_elastic_search" {
  domain_name = var.es_*******_domain
  elasticsearch_version = var.es_*******_iversion

  cluster_config {
    instance_type = var.es_*******_instance_type
    instance_count = var.es_*******_instance_count
  }

  vpc_options {
    subnet_ids = [var.es_*******_subnet_id]
    security_group_ids = [
      var.es_*******_sg_id
    ]
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.es_*******_volume_size
  }

  snapshot_options {
    automated_snapshot_start_hour = var.es_*******_automated_snapshot_start_hour
  }

  tags = var.global_tags
}
