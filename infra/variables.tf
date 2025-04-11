variable "gitlab_project_token" {
  type        = string
  description = "Gitlab repository's access token, used to add CI variables."
  sensitive   = true
}

variable "gitlab_project_id" {
  type        = number
  description = "Gitlab project ID tied to gitlab_project_token."
}

variable "kube_context" {
  type        = string
  description = "Local Kubernetes context name."
  default     = "default"
}

variable "gitlab_reg_token" {
  type        = string
  description = "The registration token of the project's Gitlab group."
  sensitive   = true
}

variable "gitlab_url" {
  type        = string
  description = "Gitlab instance URL. Example: https://gitlab.com."
}

variable "gitlab_argocd_user" {
  type        = string
  description = "Gitlab user used by ArgoCD to connect to the repositories."
  default     = "argocd"
}

variable "gitlab_argocd_token" {
  type        = string
  description = "Gitlab token used by ArgoCD to connect to the repositories."
  sensitive   = true
}

variable "grafana_admin_password" {
  type        = string
  description = "The admin password for Grafana, overrides the generated one."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "le_email_address" {
  type        = string
  description = "Email address used by Let's Encrypt configuration in Cert Manager."
  sensitive   = true
}

variable "ingress_class_name" {
  type        = string
  description = "Default ingress class name in the Kubernetes cluster."
  default     = "nginx"
}

variable "kc_cluster_issuer" {
  type        = string
  description = "Cluster Issuer used with Cert Manager. Possible values: letsencrypt-staging, letsencrypt-prod."
}

variable "kc_admin_user" {
  type        = string
  description = "Keycloak admin user."
  default     = null
  sensitive   = true
  nullable    = true
}
variable "kc_admin_password" {
  type        = string
  description = "Keycloak admin password."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "kc_pgsql_postgres_password" {
  type        = string
  description = "Keycloak PostgreSQL password for postgres user."
  default     = null
  sensitive   = true
  nullable    = true
}
variable "kc_pgsql_username" {
  type        = string
  description = "Keycloak PostgreSQL username."
  default     = null
  sensitive   = true
  nullable    = true
}
variable "kc_pgsql_password" {
  type        = string
  description = "Keycloak PostgreSQL password."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "argocd_admin_password" {
  type        = string
  description = "Plain ArgoCD admin password."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "container_registry_server" {
  type        = string
  description = "Container registry host."
}

variable "container_registry_username" {
  type        = string
  description = "Container registry username."
  sensitive   = true
}

variable "container_registry_password" {
  type        = string
  description = "Container registry password."
  sensitive   = true
}

variable "internal_container_registry_server" {
  type        = string
  description = "Internal container registry host."
}

variable "internal_container_registry_username" {
  type        = string
  description = "Internal container registry username."
  sensitive   = true
}

variable "internal_container_registry_password" {
  type        = string
  description = "Internal container registry password."
  sensitive   = true
}

variable "grafana_oauth_client_id" {
  type        = string
  description = "OAuth Client ID for Grafana."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "grafana_oauth_client_secret" {
  type        = string
  description = "OAuth Client Secret for Grafana."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "base_domain" {
  type        = string
  description = "Host base domain for Ingresses."
}

variable "realm_name" {
  type        = string
  description = "Keycloak realm name."
}

variable "helm_secrets_image_tag" {
  type        = string
  description = "Helm secrets version, used by ArgoCD repo server."
}

variable "s3_region" {
  type        = string
  description = "External S3 region. Used by the monitoring stack."
}

variable "s3_access_key_id" {
  type        = string
  description = "External S3 access key id. Used by the monitoring stack."
}

variable "s3_secret_access_key" {
  type        = string
  description = "External S3 secret access key. Used by the monitoring stack."
}

variable "s3_endpoint" {
  type        = string
  description = "External S3 endpoint. Used by the monitoring stack."
}

variable "cert_challenge_dns01_application_key" {
  type        = string
  description = "Cert manager's DNS01 challenge application key"
}

variable "cert_challenge_dns01_secret_name" {
  type        = string
  description = "Cert manager's DNS01 challenge secret name"
}

variable "cert_challenge_dns01_consumer_key" {
  type        = string
  description = "Cert manager's DNS01 challenge consumer key"
}

variable "cert_challenge_dns01_endpoint" {
  type        = string
  description = "Cert manager's DNS01 challenge endpoint"
}

variable "cert_challenge_dns01_group_name" {
  type        = string
  description = "Cert manager's DNS01 challenge group name"
}

variable "cert_challenge_dns01_solver_name" {
  type        = string
  description = "Cert manager's DNS01 challenge solver name"
}

variable "jupyterhub_client_secret" {
  type        = string
  description = "JupyterHub client secret generated on Keycloak."
  nullable    = true
  default     = null
}

variable "minio_client_secret" {
  type        = string
  description = "MinIO client secret generated on Keycloak."
  nullable    = true
  default     = null
}

variable "workflows_sso_client_id" {
  type        = string
  description = "Argo Workflows client ID generated on Keycloak."
  nullable    = true
  default     = null
}

variable "workflows_sso_client_secret" {
  type        = string
  description = "Argo Workflows client secret generated on Keycloak."
  nullable    = true
  default     = null
}

variable "prod_minio_tenant_access_key" {
  type        = string
  description = "MinIO tenant access key for production."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "prod_minio_tenant_secret_key" {
  type        = string
  description = "MinIO tenant secret key for production."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "prod_jupyterhub_sqlite_password" {
  type        = string
  description = "Jupyterhub SQLite password for production."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "prod_workflows_minio_access_key" {
  type        = string
  description = "Account for Argo Workflows to be created in shared MinIO instance."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "prod_workflows_minio_secret_key" {
  type        = string
  description = "Account for Argo Workflows to be created in shared MinIO instance."
  default     = null
  sensitive   = true
  nullable    = true
}

variable "docusaurus_client_secret" {
  type        = string
  description = "Docusaurus OAuth2 client secret generated on Keycloak."
  nullable    = true
  default     = null
}

