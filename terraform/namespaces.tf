resource "kubernetes_namespace" "k8s-addons" {
  metadata {
    name = "k8s-addons"
  }
}
