resource "scaleway_k8s_cluster" "xebia4ever-breakathon" {
  name    = "xebia4ever-breakathon"
  description = "Main Kubernetes cluster ${local.desc_purpose}"
  tags = locals.common_tags

  version = "1.20.4"
  cni     = "cilium"
}

resource "scaleway_k8s_pool" "john" {
  cluster_id = scaleway_k8s_cluster.xebia4ever-breakathon.id
  name       = "xebia4ever-breakathon-kapsule-node"
  node_type  = "DEV1-M"
  size       = 1

  tags = locals.common_tags
}
