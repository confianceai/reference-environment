#################
## MIDDLEWARES ##
#################

// Generate a random password for Grafana admin
resource "random_password" "grafana_admin_password" {
  length = 25
}

// Store the Grafana admin password in GitLab project variables
resource "gitlab_project_variable" "grafana_admin_password" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_grafana_admin_password"
  value     = random_password.grafana_admin_password.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random username for Keycloak admin
resource "random_password" "kc_admin_user" {
  length = 25
}

// Store the Keycloak admin username in GitLab project variables
resource "gitlab_project_variable" "kc_admin_user" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_kc_admin_user"
  value     = random_password.kc_admin_user.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random password for Keycloak admin
resource "random_password" "kc_admin_password" {
  length = 25
}

// Store the Keycloak admin password in GitLab project variables
resource "gitlab_project_variable" "kc_admin_password" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_kc_admin_password"
  value     = random_password.kc_admin_password.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random password for Keycloak PostgreSQL
resource "random_password" "kc_pgsql_postgres_password" {
  length = 25
}

// Store the Keycloak PostgreSQL password in GitLab project variables
resource "gitlab_project_variable" "kc_pgsql_postgres_password" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_kc_pgsql_postgres_password"
  value     = random_password.kc_pgsql_postgres_password.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random username for Keycloak PostgreSQL
resource "random_password" "kc_pgsql_username" {
  length = 25
}

// Store the Keycloak PostgreSQL username in GitLab project variables
resource "gitlab_project_variable" "kc_pgsql_username" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_kc_pgsql_username"
  value     = random_password.kc_pgsql_username.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random password for Keycloak PostgreSQL user
resource "random_password" "kc_pgsql_password" {
  length = 25
}

// Store the Keycloak PostgreSQL user password in GitLab project variables
resource "gitlab_project_variable" "kc_pgsql_password" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_kc_pgsql_password"
  value     = random_password.kc_pgsql_password.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random password for ArgoCD admin
resource "random_password" "argocd_admin_password" {
  length = 15
}

// Store the ArgoCD admin password in GitLab project variables
resource "gitlab_project_variable" "argocd_admin_password" {
  project   = var.gitlab_project_id
  key       = "TF_VAR_argocd_admin_password"
  value     = var.argocd_admin_password != null ? var.argocd_admin_password : random_password.argocd_admin_password.result
  raw       = true
  protected = false
  masked    = true
}

############################
## REGISTRY CREDS SECRETS ##
############################

// Create a Kubernetes namespace named "shared"
resource "kubernetes_namespace" "shared" {
  metadata {
    name = "shared"
  }
}

// Create a Kubernetes secret for Docker registry credentials in the "shared" namespace
resource "kubernetes_secret" "regcred_secret_shared" {
  metadata {
    name      = "regcred"
    namespace = "shared"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        (var.container_registry_server) = {
          "username" = var.container_registry_username
          "password" = var.container_registry_password
          "auth"     = base64encode("${var.container_registry_username}:${var.container_registry_password}")
        },
        (var.internal_container_registry_server) = {
          "username" = var.internal_container_registry_username
          "password" = var.internal_container_registry_password
          "auth"     = base64encode("${var.internal_container_registry_username}:${var.internal_container_registry_password}")
        }
      }
    })
  }
}


// Create a Kubernetes namespace named "minio"
resource "kubernetes_namespace" "minio" {
  metadata {
    name = "minio"
  }
}

// Create a Kubernetes secret for Docker registry credentials in the "minio" namespace
resource "kubernetes_secret" "regcred_secret_minio" {
  metadata {
    name      = "regcred"
    namespace = "minio"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        (var.container_registry_server) = {
          "username" = var.container_registry_username
          "password" = var.container_registry_password
          "auth"     = base64encode("${var.container_registry_username}:${var.container_registry_password}")
        }
      }
    })
  }
}

########################
## COMPONENTS SECRETS ##
########################

// Generate a random access key for MinIO tenant in production
resource "random_password" "prod_minio_tenant_access_key" {
  # Specification from AWS
  length  = 20
  special = false
}

// Store the MinIO tenant access key in GitLab project variables
resource "gitlab_project_variable" "prod_minio_tenant_access_key" {
  project   = var.gitlab_project_id
  key       = "prod_minio_tenant_access_key"
  value     = var.prod_minio_tenant_access_key != null ? var.prod_minio_tenant_access_key : random_password.prod_minio_tenant_access_key.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random secret key for MinIO tenant in production
resource "random_password" "prod_minio_tenant_secret_key" {
  # Specification from AWS
  length           = 40
  special          = true
  override_special = "/+"
}

// Store the MinIO tenant secret key in GitLab project variables
resource "gitlab_project_variable" "prod_minio_tenant_secret_key" {
  project   = var.gitlab_project_id
  key       = "prod_minio_tenant_secret_key"
  value     = var.prod_minio_tenant_secret_key != null ? var.prod_minio_tenant_secret_key : random_password.prod_minio_tenant_secret_key.result
  raw       = true
  protected = false
  masked    = true
}

resource "gitlab_project_variable" "jupyterhub_client_secret" {
  project   = var.gitlab_project_id
  key       = "prod_jupyterhub_client_secret"
  value     = var.jupyterhub_client_secret != null ? var.jupyterhub_client_secret : ""
  raw       = true
  protected = false
  masked    = true
}

// Generate a random password for Jupyterhub SQLite in production
resource "random_password" "prod_jupyterhub_sqlite_password" {
  length           = 40
  special          = true
  override_special = "/+"
}

// Store the Jupyterhub SQLite password in GitLab project variables
resource "gitlab_project_variable" "prod_jupyterhub_sqlite_password" {
  project   = var.gitlab_project_id
  key       = "prod_jupyterhub_sqlite_password"
  value     = var.prod_jupyterhub_sqlite_password != null ? var.prod_jupyterhub_sqlite_password : random_password.prod_jupyterhub_sqlite_password.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random username for Argo Workflows PostgreSQL instance in production
resource "random_password" "prod_argo_workflows_pg_username" {
  length  = 15
  special = false
}

// Store the Argo Workflows PostgreSQL instance username in GitLab project variables
resource "gitlab_project_variable" "prod_argo_workflows_pg_username" {
  project   = var.gitlab_project_id
  key       = "prod_argo_workflows_pg_username"
  value     = random_password.prod_argo_workflows_pg_username.result
  raw       = true
  protected = false
  masked    = true
}
// Generate a random password for Argo Workflows PostgreSQL instance in production
resource "random_password" "prod_argo_workflows_pg_password" {
  length           = 15
  special          = true
  override_special = "-+"
}

// Store the Argo Workflows PostgreSQL instance password in GitLab project variables
resource "gitlab_project_variable" "prod_argo_workflows_pg_password" {
  project   = var.gitlab_project_id
  key       = "prod_argo_workflows_pg_password"
  value     = random_password.prod_argo_workflows_pg_password.result
  raw       = true
  protected = false
  masked    = true
}

resource "kubernetes_secret" "prod_argo_workflows_pg" {
  metadata {
    name      = "argo-postgres-config"
    namespace = "shared"
  }
  type = "Opaque"

  data = {
    username = gitlab_project_variable.prod_argo_workflows_pg_username.value
    password = gitlab_project_variable.prod_argo_workflows_pg_password.value
  }
}

// Generate a random access key for MinIO tenant in production
resource "random_password" "prod_workflows_minio_access_key" {
  # Specification from AWS
  length  = 20
  special = false
}

// Store the MinIO tenant access key in GitLab project variables
resource "gitlab_project_variable" "prod_workflows_minio_access_key" {
  project   = var.gitlab_project_id
  key       = "prod_workflows_minio_access_key"
  value     = var.prod_workflows_minio_access_key != null ? var.prod_workflows_minio_access_key : random_password.prod_workflows_minio_access_key.result
  raw       = true
  protected = false
  masked    = true
}

// Generate a random secret key for MinIO tenant in production
resource "random_password" "prod_workflows_minio_secret_key" {
  # Specification from AWS
  length           = 40
  special          = true
  override_special = "/+"
}

// Store the MinIO tenant secret key in GitLab project variables
resource "gitlab_project_variable" "prod_workflows_minio_secret_key" {
  project   = var.gitlab_project_id
  key       = "prod_workflows_minio_secret_key"
  value     = var.prod_workflows_minio_secret_key != null ? var.prod_workflows_minio_secret_key : random_password.prod_workflows_minio_secret_key.result
  raw       = true
  protected = false
  masked    = true
}

// Set MinIO tenant creds in a secret for Argo Workflows to use
resource "kubernetes_secret" "prod_workflows_minio" {
  metadata {
    name      = "workflows-minio"
    namespace = "shared"
  }
  type = "Opaque"

  data = {
    accesskey = gitlab_project_variable.prod_workflows_minio_access_key.value
    secretkey = gitlab_project_variable.prod_workflows_minio_secret_key.value
  }
}

resource "gitlab_project_variable" "prod_workflows_minio_sso" {
  project   = var.gitlab_project_id
  key       = "prod_minio_client_secret"
  value     = var.minio_client_secret != null ? var.minio_client_secret : ""
  raw       = true
  protected = false
  masked    = true
}

resource "kubernetes_secret" "prod_workflows_sso" {
  metadata {
    name      = "argo-server-sso"
    namespace = "shared"
  }
  type = "Opaque"

  data = {
    client-id     = var.workflows_sso_client_id != null ? var.workflows_sso_client_id : ""
    client-secret = var.workflows_sso_client_secret != null ? var.workflows_sso_client_secret : ""
  }
}

# Docusaurus OAuth2 client secret
resource "gitlab_project_variable" "prod_docusaurus_sso" {
  project   = var.gitlab_project_id
  key       = "prod_docusaurus_client_secret"
  value     = var.docusaurus_client_secret != null ? var.docusaurus_client_secret : ""
  raw       = true
  protected = false
  masked    = true
}

