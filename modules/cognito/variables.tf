
variable "user_pool_name" {
  description = "Name of the AWS Cognito User Pool"
}

variable "deletion_protection" {
  description = "Deletion protection setting for the User Pool"
  type        = string
}

variable "minimum_password_length" {
  description = "Minimum length for user passwords"
  type        = number
}

variable "require_lowercase" {
  description = "Require lowercase characters in passwords"
  type        = bool
}

variable "require_numbers" {
  description = "Require numbers in passwords"
  type        = bool
}

variable "require_symbols" {
  description = "Require symbols in passwords"
  type        = bool
}

variable "require_uppercase" {
  description = "Require uppercase characters in passwords"
  type        = bool
}
variable "temporary_password_validity_days" {
  description = "Temporary password validity days"
  type        = number
}

variable "callback_urls" {
  description = "List of callback URLs for the User Pool Client"
  type        = list(string)
}
variable "allowed_oauth_flows" {
  description = "List of allowed OAuth flows for the User Pool Client"
  type        = list(string)
}
variable "allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes for the User Pool Client"
  type        = list(string)
}
variable "explicit_auth_flows" {
  description = "List of explicit authentication flows for the User Pool Client"
  type        = list(string)
}

variable "domain_name" {
  description = "Domain name for the User Pool"
  type        = string
}

variable "recovery_mechanism_name" {
  description = "Name of the recovery mechanism"
  type        = string
}
variable "recovery_mechanism_priority" {
  description = "Priority of the recovery mechanism"
  type        = number
}


variable "username_attributes" {
  description = "List of username attributes."
  type        = list(string)
}

variable "region" {
            description = "The region where the resources will be deployed. This can correspond to the region of any cloud provider, such as AWS, Azure, Google Cloud, etc."
            type        = string
          }
          variable "environment" {
            description = "The environment (e.g., dev, prod)"
            type        = string
          }

variable "user_pool_client_name" {
  description = "Name of the userpool app client."
  type        = string
}

variable "identity_pool_name" {
  description = "Name of the identity pool."
  type        = string
}

variable "allow_unauthenticated_identities" {
  type        = string
}

variable "supported_identity_providers" {
  description = "List of supported identity providers for the User Pool Client"
  type        = list(string)
}

