resource "kubernetes_namespace" "ci-cd-tooling" {
  provider = kubernetes.kapsule_software
  metadata {
    name = "ci-cd-tooling"
  }
}

data "sops_file" "argocd-secret-values" {
  source_file = "${path.module}/argocd-values.enc.yaml"
}

resource "helm_release" "argocd" {
  provider    = helm.kapsule_software
  name        = "argocd"

  repository  = "https://argoproj.github.io/argo-helm"
  chart       = "argo-cd"
  version     = "2.17.4"

  namespace   = kubernetes_namespace.ci-cd-tooling.metadata[0].name
  atomic      = true
  values      = [
    file("${path.root}/argocd-values.yaml"),
    data.sops_file.argocd-secret-values.raw
  ]
}
