variable "ecr_repository_name" {
  type        = string
  description = "ecr repository name"
}

variable "region" {
          type = string
          description = "The environment to deploy to (e.g. dev, qa)"
        }
        