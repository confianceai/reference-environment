resource "kubernetes_namespace" "regcred_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "regcred_secret" {

  metadata {
    name      = "regcred"
    namespace = var.name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}

resource "helm_release" "release" {
  count            = var.chart != null ? 1 : 0
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  namespace        = var.namespace
  version          = var.chart_version
  create_namespace = true
  reuse_values     = true
  upgrade_install  = true
  depends_on       = [kubernetes_secret.regcred_secret]

  values = [
    templatefile(var.values_file, var.values_variables)
  ]

  dynamic "set" {
    for_each = var.set_values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }

  dynamic "set_list" {
    for_each = var.set_list_values
    content {
      name  = set_list.value["name"]
      value = set_list.value["value"]
    }
  }
}
