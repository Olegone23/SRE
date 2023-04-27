resource "aws_security_group" "airflow-sgDocker" {
  name        = var.sg_ec2_name
  description = "Allow inbound traffic for the Airflow dockerhost"
  vpc_id      = var.vpc_id
  tags = merge(
      var.tags,
      {
      "Name"           = var.sg_ec2_name
      },
  )
  # Allow access to Airflow web UI from Internet
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    security_groups = ["sg-0093820, sg-7h6duw1"]
  }

  # Allow access to Airflow cli from bst-eu bastion
  ingress {
    from_port = 5555
    to_port   = 5555
    protocol  = "tcp"
    description = "bastion-eu"
    cidr_blocks = ["*.*.*.*/32"]
  }

  # Allow SSH from bst-eu bastion
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    description = "bastion-eu"
    cidr_blocks = ["*.*.*.*/32"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

