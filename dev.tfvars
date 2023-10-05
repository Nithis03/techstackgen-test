region = "eu-west-1"
environment = "dev"
user_pool_name = "techstack"
user_pool_client_name = "techstach-client"
identity_pool_name = "techstackgen"
allow_unauthenticated_identities = "false"
deletion_protection = "ACTIVE"
minimum_password_length = 9
require_lowercase = true
require_numbers = false
require_symbols = true
require_uppercase = false
temporary_password_validity_days = 90
callback_urls = ["http://localhost:3000/","http://localhost:3001"]
allowed_oauth_flows = ["code", "implicit"]
allowed_oauth_scopes = ["email", "openid", "profile"]
explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH"]
domain_name = "techstackgen"
recovery_mechanism_name = "verified_email"
recovery_mechanism_priority = "1"
username_attributes = ["email"]
supported_identity_providers = ["COGNITO"]

#ecr
ecr_repository_name = "techstackgen-repo"

#ecs
ecs_cluster_name     = "cmd-clus"
ecs_service_name     = "cmd-serv"
git_repository_url   = "https://github.com/Nithis03/techstackgen-nest.git"
ecr_image_uri        = "203320314678.dkr.ecr.eu-west-1.amazonaws.com/techstackgen-repo:latest"
ecs_container_name   = "cmd-cont"
ecs_container_port_no = 80
