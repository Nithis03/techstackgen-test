provider "aws" {
  region = var.region
}

resource "aws_cognito_user_pool" "userpool" {
  name = var.user_pool_name

  account_recovery_setting {
    recovery_mechanism {
      name     = var.recovery_mechanism_name
      priority = var.recovery_mechanism_priority
    }
  }

  password_policy {
    minimum_length                   = var.minimum_password_length
    require_lowercase                = var.require_lowercase
    require_numbers                  = var.require_numbers
    require_symbols                  = var.require_symbols
    require_uppercase                = var.require_uppercase
    temporary_password_validity_days = var.temporary_password_validity_days
  }

  schema {
    name                     = "email"    //Add required schema here
    attribute_data_type      = "String"
    mutable                  = true
    required                 = true
  }

    deletion_protection = var.deletion_protection
    username_attributes = var.username_attributes

    lambda_config {
      pre_sign_up = "arn:aws:lambda:eu-west-1:203320314678:function:prospect-test"
    }
}

  resource "aws_cognito_user_pool_client" "userpool_client" {
    name                                 = var.user_pool_client_name
    user_pool_id                         = aws_cognito_user_pool.userpool.id
    callback_urls                        = var.callback_urls
    allowed_oauth_flows                  = var.allowed_oauth_flows
    allowed_oauth_scopes                 = var.allowed_oauth_scopes
    supported_identity_providers         = var.supported_identity_providers
    explicit_auth_flows                  = var.explicit_auth_flows
  }

  resource "aws_cognito_user_pool_domain" "main" {
    domain       = var.domain_name
    user_pool_id = aws_cognito_user_pool.userpool.id
  }

  resource "aws_cognito_identity_pool" "main" {
    identity_pool_name               = var.identity_pool_name
    allow_unauthenticated_identities = var.allow_unauthenticated_identities
  }

  data "aws_iam_policy_document" "authenticated" {
    statement {
      effect = "Allow"
      principals {
        type        = "Federated"
        identifiers = ["cognito-identity.amazonaws.com"]
      }

      actions = ["sts:AssumeRoleWithWebIdentity"]

      condition {
        test     = "StringEquals"
        variable = "cognito-identity.amazonaws.com:aud"
        values   = [aws_cognito_identity_pool.main.id]
      }

      condition {
        test     = "ForAnyValue:StringLike"
        variable = "cognito-identity.amazonaws.com:amr"
        values   = ["authenticated"]
      }
    }
  }

  resource "aws_iam_role" "authenticated" {
    name               = "cognito-authenticated-${var.environment}"
    assume_role_policy = data.aws_iam_policy_document.authenticated.json
  }

  data "aws_iam_policy_document" "authenticated_role_policy" {
    statement {
      effect = "Allow"

      actions = [
        "mobileanalytics:PutEvents",
        "cognito-sync:*",
        "cognito-identity:*",
      ]

      resources = ["*"]
    }
  }

  resource "aws_iam_role_policy" "authenticated" {
    name   = "authenticated-policy-${var.environment}"
    role   = aws_iam_role.authenticated.id
    policy = data.aws_iam_policy_document.authenticated_role_policy.json
  }


  resource "aws_cognito_identity_pool_roles_attachment" "main" {
    identity_pool_id = aws_cognito_identity_pool.main.id

    roles = {
      "authenticated" = aws_iam_role.authenticated.arn
    }
  }

