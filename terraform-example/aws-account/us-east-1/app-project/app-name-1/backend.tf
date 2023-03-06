terraform {
  backend "s3" {
    bucket = "aws-nonprod-terraform-******-com"
    key    = "***/********/us-east-1/***/****/app/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
