provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "aws-nonprod-terraform-***-com"
    key    = "dh"
    region = "us-east-1"
  }
}
