aws_region          = "eu-central-1"
ami                 = "ami-0607323e705d8fe24" #ubuntu
instance_type       = "t3.large"
instance_count      = 1
root_ebs_size       = 20
iam_role            = "ec2-eu-docker-internal"
vpc_id              = "vpc-f236a29a"
subnet_ids          = ["subnet-bf2677d7","subnet-03f46b79"]
keyname             = "eu-central-1-airflow-key"
sg_ec2_name         = "non-prod-sgDocker"
