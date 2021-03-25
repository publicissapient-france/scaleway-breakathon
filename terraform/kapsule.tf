resource "scaleway_k8s_cluster" "xebia4ever-breakathon" {
  name    = "xebia4ever-breakathon"
  description = "Main Kubernetes cluster for the Scaleway Breakathon by the Xebia4Ever team"

  version = "1.20.4"
  cni     = "cilium"
}

resource "scaleway_k8s_pool" "john" {
  cluster_id = scaleway_k8s_cluster.xebia4ever-breakathon.id
  name       = "xebia4ever-breakathon-kapsule-node"
  node_type  = "DEV1-M"
  size       = 1
}
