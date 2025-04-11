// Deploy GitLab Runner using Helm chart
module "gitlab_runner" {
  source        = "./modules/helm"
  name          = "gitlab-runner"
  repository    = "https://charts.gitlab.io"
  chart         = "gitlab-runner"
  namespace     = "gitlab-runner"
  chart_version = "0.71.0"
  values_file   = "helm-values/runner.override.yaml"

  set_values = [
    {
      name  = "runnerToken"
      value = var.gitlab_reg_token
    },
    {
      name  = "gitlabUrl"
      value = var.gitlab_url
    }
  ]

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Deploy Cert-Manager using Helm chart
module "cert_manager" {
  source        = "./modules/helm"
  name          = "cert-manager"
  repository    = "https://charts.jetstack.io"
  chart         = "cert-manager"
  namespace     = "cert-manager"
  chart_version = "v1.16.2"

  values_file = "helm-values/cert-manager.override.yaml"

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Create ClusterIssuer for Let's Encrypt staging environment
resource "kubernetes_manifest" "cluster_issuer_le_staging" {
  depends_on = [module.cert_manager]
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-staging"
    }
    spec = {
      acme = {
        server = "https://acme-staging-v02.api.letsencrypt.org/directory"
        email  = var.le_email_address
        privateKeySecretRef = {
          name = "letsencrypt-staging"
        }
        solvers = [
          # TODO make this field dynamic with chosen variables
          # {
          #   http01 = {
          #     ingress = {
          #       ingressClassName = var.ingress_class_name
          #     }
          #   }
          # },
          {
            dns01 = {
              webhook = {
                config = {
                  applicationKey = var.cert_challenge_dns01_application_key
                  applicationSecretRef = {
                    key  = "applicationSecret"
                    name = var.cert_challenge_dns01_secret_name
                  }
                  consumerKey = var.cert_challenge_dns01_consumer_key
                  endpoint    = var.cert_challenge_dns01_endpoint
                }
                groupName  = var.cert_challenge_dns01_group_name
                solverName = var.cert_challenge_dns01_solver_name
              }
            }
          }
        ]
      }
    }
  }
}

// Create ClusterIssuer for Let's Encrypt production environment
resource "kubernetes_manifest" "cluster_issuer_le_prod" {
  depends_on = [module.cert_manager]
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = var.le_email_address
        privateKeySecretRef = {
          name = "letsencrypt-prod"
        }
        solvers = [
          // {
          //   http01 = {
          //     ingress = {
          //       ingressClassName = var.ingress_class_name
          //     }
          //   }
          // },
          {
            dns01 = {
              webhook = {
                config = {
                  applicationKey = var.cert_challenge_dns01_application_key
                  applicationSecretRef = {
                    key  = "applicationSecret"
                    name = var.cert_challenge_dns01_secret_name
                  }
                  consumerKey = var.cert_challenge_dns01_consumer_key
                  endpoint    = var.cert_challenge_dns01_endpoint
                }
                groupName  = var.cert_challenge_dns01_group_name
                solverName = var.cert_challenge_dns01_solver_name
              }
            }
          }
        ]
      }
    }
  }
}

// Deploy MetalLB using Helm chart
module "metallb" {
  source        = "./modules/helm"
  name          = "metallb"
  repository    = "https://metallb.github.io/metallb"
  chart         = "metallb"
  namespace     = "metallb"
  chart_version = "0.14.9"
  values_file   = "helm-values/metallb.override.yaml"

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Deploy Ingress NGINX using Helm chart
module "nginx" {
  source        = "./modules/helm"
  name          = "ingress-nginx"
  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  namespace     = "ingress-nginx"
  chart_version = "4.11.3"

  values_file = "helm-values/nginx.override.yaml"

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Deploy Keycloak using Helm chart
module "keycloak" {
  source        = "./modules/helm"
  name          = "keycloak"
  repository    = "oci://registry-1.docker.io/bitnamicharts"
  chart         = "keycloak"
  namespace     = "keycloak"
  depends_on    = [module.cert_manager]
  chart_version = "24.4.6"

  values_file = "helm-values/keycloak.override.yaml"
  values_variables = {
    KC_CLUSTER_ISSUER          = var.kc_cluster_issuer
    KC_ADMIN_USER              = var.kc_admin_user != null ? var.kc_admin_user : gitlab_project_variable.kc_admin_user.value
    KC_ADMIN_PASSWORD          = var.kc_admin_password != null ? var.kc_admin_password : gitlab_project_variable.kc_admin_password.value
    KC_PGSQL_POSTGRES_PASSWORD = var.kc_pgsql_postgres_password != null ? var.kc_pgsql_postgres_password : gitlab_project_variable.kc_pgsql_postgres_password.value
    KC_PGSQL_USERNAME          = var.kc_pgsql_username != null ? var.kc_pgsql_username : gitlab_project_variable.kc_pgsql_username.value
    KC_PGSQL_PASSWORD          = var.kc_pgsql_password != null ? var.kc_pgsql_password : gitlab_project_variable.kc_pgsql_postgres_password.value
    HOSTNAME                   = "auth.${var.base_domain}"
  }

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

#######################
# Observability stack #
#######################

// Deploy Alloy Stack using Helm chart
module "alloy_stack" {
  source        = "./modules/helm"
  name          = "alloy"
  repository    = "https://grafana.github.io/helm-charts"
  chart         = "k8s-monitoring"
  namespace     = "alloy"
  chart_version = "2.0.3"

  values_file = "helm-values/alloy-stack.override.yaml"

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Create S3 buckets for Loki and Mimir
resource "aws_s3_bucket" "loki_chunks" {
  bucket = "etf-loki-chunks"
}

resource "aws_s3_bucket" "loki_ruler" {
  bucket = "etf-loki-ruler"
}

resource "aws_s3_bucket" "loki_admin" {
  bucket = "etf-loki-admin"
}

resource "aws_s3_bucket" "mimir_blocks" {
  bucket = "etf-mimir-blocks"
}

resource "aws_s3_bucket" "mimir_alertmanager" {
  bucket = "etf-mimir-alertmanager"
}

resource "aws_s3_bucket" "mimir_ruler" {
  bucket = "etf-mimir-ruler"
}

// Deploy Mimir using Helm chart
module "mimir" {
  source        = "./modules/helm"
  depends_on    = [aws_s3_bucket.mimir_ruler, aws_s3_bucket.mimir_blocks, aws_s3_bucket.mimir_alertmanager]
  name          = "mimir"
  repository    = "https://grafana.github.io/helm-charts"
  chart         = "mimir-distributed"
  namespace     = "mimir"
  chart_version = "5.5.1"

  values_file = "helm-values/mimir.override.yaml"
  values_variables = {
    BUCKET_HOST           = var.s3_endpoint
    BUCKET_PORT           = "443"
    AWS_ACCESS_KEY_ID     = var.s3_access_key_id
    AWS_SECRET_ACCESS_KEY = var.s3_secret_access_key
  }

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

// Deploy Loki using Helm chart
module "loki" {
  source        = "./modules/helm"
  depends_on    = [aws_s3_bucket.loki_admin, aws_s3_bucket.loki_chunks, aws_s3_bucket.loki_ruler]
  name          = "loki"
  repository    = "https://grafana.github.io/helm-charts"
  chart         = "loki"
  namespace     = "loki"
  chart_version = "6.19.0"

  values_file = "helm-values/loki.override.yaml"

  values_variables = {
    BUCKET_HOST           = var.s3_endpoint
    BUCKET_REGION         = var.s3_region
    AWS_ACCESS_KEY_ID     = var.s3_access_key_id
    AWS_SECRET_ACCESS_KEY = var.s3_secret_access_key
  }

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}

# Prometheus chart to deploy Grafana pre-configured for kubernetes... without deploying Prometheus!
module "grafana" {
  source        = "./modules/helm"
  name          = "grafana"
  repository    = "https://prometheus-community.github.io/helm-charts"
  chart         = "kube-prometheus-stack"
  namespace     = "grafana"
  depends_on    = [module.cert_manager]
  chart_version = "66.3.1"

  values_file = "helm-values/grafana.override.yaml"
  values_variables = {
    GLOBAL_DOMAIN  = "monitoring.${var.base_domain}"
    ADMIN_PASSWORD = var.grafana_admin_password != null ? var.grafana_admin_password : gitlab_project_variable.grafana_admin_password.value
    CLIENT_ID      = var.grafana_oauth_client_id
    CLIENT_SECRET  = var.grafana_oauth_client_secret
    AUTH_URL       = "https://auth.${var.base_domain}/realms/${var.realm_name}/protocol/openid-connect/auth"
    TOKEN_URL      = "https://auth.${var.base_domain}/realms/${var.realm_name}/protocol/openid-connect/token"
    API_URL        = "https://auth.${var.base_domain}/realms/${var.realm_name}/protocol/openid-connect/userinfo"
  }

  registry_password = var.container_registry_password
  registry_server   = var.container_registry_server
  registry_username = var.container_registry_username
}
###########################
# END Observability stack #
###########################

// Deploy ArgoCD using Helm chart
module "argocd" {
  source        = "./modules/helm"
  name          = "argocd"
  repository    = "https://argoproj.github.io/argo-helm"
  chart         = "argo-cd"
  namespace     = "argocd"
  depends_on    = [module.cert_manager]
  chart_version = "7.7.7"

  values_file = "helm-values/argocd.override.yaml"
  values_variables = {
    ARGOCD_SERVER_ADMIN_PASSWORD = bcrypt(gitlab_project_variable.argocd_admin_password.value)
    GLOBAL_DOMAIN                = "argocd.${var.base_domain}"
    IMAGE_REPOSITORY             = "${var.internal_container_registry_server}/etf/helm-secrets"
    IMAGE_TAG                    = var.helm_secrets_image_tag
    REPO_CREDS_URL               = var.gitlab_url
    REPO_CREDS_USERNAME          = var.gitlab_argocd_user
    REPO_CREDS_PASSWORD          = var.gitlab_argocd_token
  }

  registry_password = var.internal_container_registry_password
  registry_server   = var.internal_container_registry_server
  registry_username = var.internal_container_registry_username
}
