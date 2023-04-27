resource "aws_instance" "airflow-docker" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.keyname
  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = ["${aws_security_group.airflow-sgDocker.id}"]
  root_block_device {
   volume_type = "gp3"
   volume_size = var.root_ebs_size
   delete_on_termination = "true"
   encrypted = "true"
  }

  user_data     = templatefile("${path.module}/userdata.tpl", {
    host_name   = "airflow-non-prod${count.index + 1}"
    host_index  = "${count.index}"
  })
  iam_instance_profile   = var.iam_role

  tags                   = merge(
                            var.tags,
                            {
                             "Name"    = "docker-non-prod${count.index + 1}"
                            },
                            )
  volume_tags            = merge(
                            var.tags,
                            {
                            "Name"      = "docker-non-prod-prod-root${count.index + 1}"
                            },
                            )
}

resource "aws_eip" "elastic_ip" {
  count = length(aws_instance.airflow-docker)
  instance = element(aws_instance.airflow-docker.*.id,count.index)
  tags = {
    Name = "epi-airflow-docker${count.index + 1}"
  }
  vpc      = true
}
