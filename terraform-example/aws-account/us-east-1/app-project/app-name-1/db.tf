# read secrets from AWS secrets manager
data "external" "secrets" {
  program = ["../../../../../utils/json2map.sh", "***/***/db/"]
}

module "document-db" {

  source = "git@github.com:****/do-infrastructure-modules.git//cloud/aws/document-db?ref=*****"

  docdb_cluster_name = var.db_cluster_name
  docdb_availability_zone = var.db_availability_zones
  docdb_user_name = lookup(data.external.secrets.result, "DB_USER")
  docdb_user_password = lookup(data.external.secrets.result, "DB_PASSWORD")

  docdb_instance_count = var.db_instance_count
  docdb_instance_type = var.db_instance_type

  docdb_subnet_name = var.db_subnet_name
  docdb_subnet_id = var.subnet_ids

  docdb_security_group_ids = var.db_security_groups_ids

  docdb_parameter_group_family = var.db_parameter_group_family
  docdb_parameter_group_name = var.db_parameter_group_name
  docdb_parameter_group_description = var.db_parameter_group_description

  docdb_tags = var.global_tags
}
