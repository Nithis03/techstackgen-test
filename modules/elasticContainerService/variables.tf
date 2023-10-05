variable "region" {
    description = "The region where the resources will be deployed. This can correspond to the region of any cloud provider, such as AWS, Azure, Google Cloud, etc."
    type        = string
}

variable "environment" {
    description = "The environment (e.g., dev, prod)"
    type        = string
}

variable "ecr_repository_name" {
  type        = string
  description = "ecr repository name"
  default = "test"
}
variable "ecs_service_name" {
  type        = string
  description = "ecs service name"
}

variable "ecs_container_name" {
  type        = string
  description = "ecs service name"
}

variable "ecs_container_port_no" {
  type        = number
  description = "ecs container port name"
}

variable "git_repository_url" {
  type        = string
  description = "git repository URL"
}

variable "ecr_image_uri" {
  type        = string
  description = "ecr image URI"
}

variable "ecs_cluster_name" {
    description = "The ecs cluster name"
    type        = string
}

