resource "helm_release" "cert_manager" {
  name        = "cert-manager"

  repository  = "https://charts.jetstack.io"
  chart       = "cert-manager"
  version     = "1.0.4"

  namespace   = "k8s-addons"

  atomic      = true
  depends_on  = [kubernetes_namespace.k8s-addons]
  values      = [file("${path.module}/k8s-addon-cert-manager-values.yaml")]
}

resource "kubectl_manifest" "cert_manager_cluster_issuer" {
  yaml_body = file("${path.module}/k8s-addon-cert-manager-cluster-issuer.yaml")
  depends_on = [helm_release.cert_manager]
}
