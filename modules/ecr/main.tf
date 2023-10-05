provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "ecr" {
  name = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"
}