output "vpc_id" {
  value = var.vpc_ids[var.vpc_name]
}

output "subnet_ids" {
  value = var.subnet_ids[var.vpc_name]
}

output "security_groups" {
  value = var.security_group_ids[var.vpc_name]
}
