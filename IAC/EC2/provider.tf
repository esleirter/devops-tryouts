# Configure the AWS provider
terraform {
  backend "s3" {
    bucket = "CHANGEME"
    key    = "CHANGEME/tryouts/terraform.tfstate"
    region = "us-east-2"
  }
}