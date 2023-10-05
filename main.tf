provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.5.1"
  backend "s3" {}
}


module "cognito" {
  source = "./modules/cognito"
  region = var.region
  environment = var.environment
  user_pool_name = var.user_pool_name
  domain_name = var.domain_name
  user_pool_client_name = var.user_pool_client_name
  deletion_protection = var.deletion_protection
  callback_urls = var.callback_urls
  allowed_oauth_flows = var.allowed_oauth_flows
  allowed_oauth_scopes = var.allowed_oauth_scopes
  explicit_auth_flows = var.explicit_auth_flows
  recovery_mechanism_name = var.recovery_mechanism_name
  recovery_mechanism_priority = var.recovery_mechanism_priority
  username_attributes = var.username_attributes  
  identity_pool_name = var.identity_pool_name
  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  minimum_password_length = var.minimum_password_length
  require_lowercase = var.require_lowercase
  require_numbers = var.require_numbers
  require_symbols = var.require_symbols
  require_uppercase = var.require_uppercase
  supported_identity_providers         = var.supported_identity_providers
  temporary_password_validity_days = var.temporary_password_validity_days
}


module "ecr" {
  source               = "./modules/ecr"
  region               = var.region
  ecr_repository_name  = var.ecr_repository_name
}

module "elasticContainer" {
  source               = "./modules/elasticContainerService"
  region               = var.region
  environment          = var.environment
  ecs_cluster_name     = var.ecs_cluster_name
  ecs_service_name     = var.ecs_service_name
  git_repository_url   = var.git_repository_url
  ecr_image_uri        = var.ecr_image_uri
  ecs_container_name   = var.ecs_container_name
  ecs_container_port_no = var.ecs_container_port_no
}