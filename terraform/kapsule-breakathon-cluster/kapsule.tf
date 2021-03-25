resource "scaleway_k8s_cluster" "breakathon_k8s_cluster" {
  name        = "kbreak-${var.challenge_slug}-xebia4ever"
  description = "${var.challenge} Challenge - Kubernetes cluster ${local.desc_purpose}"
  tags        = var.common_tags

  version = "1.20.2"
  cni     = "cilium"
}

resource "scaleway_k8s_pool" "pool" {
  cluster_id  = scaleway_k8s_cluster.breakathon_k8s_cluster.id
  name        = "default"
  node_type   = "DEV1-M"
  size        = 1
  min_size    = 1
  max_size    = 5
  autoscaling = true
  autohealing = true

  tags = var.common_tags
}
