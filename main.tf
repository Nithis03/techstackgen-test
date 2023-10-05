provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.5.1"
  backend "s3" {}
}
