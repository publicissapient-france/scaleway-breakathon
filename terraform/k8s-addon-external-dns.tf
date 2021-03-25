resource "helm_release" "external_dns_public_ingress" {
  name        = "external-dns-public-ingress"

  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "external-dns"
  version     = "4.9.3"

  namespace   = "k8s-addons"

  atomic      = true
  depends_on  = [kubernetes_namespace.k8s-addons] # TODO cluster
  values      = [templatefile("${path.root}/k8s-addon-external-dns-values.yaml", {
    txt_owner = "external-dns-xebia4ever-breakathon"
  })]
}
# TODO:
# - Inject the domain name based on a Scaleway DNS data source?
# - Decrypt key values somehow
