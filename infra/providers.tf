terraform {
  required_version = ">=1.9"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.0"
    }

    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~>17.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  backend "http" {}
}

## Uncomment for local execution
# provider "helm" {
#   kubernetes {
#     config_path    = "~/.kube/config"
#     config_context = "confiance-etf"
#   }
# }

## Uncomment for local execution
# provider "kubernetes" {
#   config_path    = "~/.kube/config"
#   config_context = "confiance-etf"
# }

provider "gitlab" {
  base_url = <to be defined>
  token    = var.gitlab_project_token
}

provider "aws" {
  region     = var.s3_region
  access_key = var.s3_access_key_id
  secret_key = var.s3_secret_access_key

  #OVH implementation has no STS service
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  # the gra region is unknown to AWS hence skipping is needed.
  skip_region_validation = true
  endpoints {
    s3 = "https://${var.s3_endpoint}"
  }
}
