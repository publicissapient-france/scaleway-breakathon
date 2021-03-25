resource "helm_release" "argocd" {
  name        = "argocd"

  repository  = "https://argoproj.github.io/argo-helm"
  chart       = "argo-cd"
  version     = "2.17.4"

  namespace   = "k8s-addons"
  atomic      = true
  values      = [file("${path.root}/k8s-addon-argocd-values.yaml")]
}
