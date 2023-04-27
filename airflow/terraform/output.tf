output "instance_ids" {
  value = ["${aws_instance.airflow-docker.*.id}"]
}

