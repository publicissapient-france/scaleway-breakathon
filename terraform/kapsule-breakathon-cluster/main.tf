terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.3"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.6.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.10.0"
    }
  }
  required_version = ">= 0.14"
}

provider "kubernetes" {
  config_path = "~/.kube/kubeconfig-kbreak-${var.challenge_slug}-xebia4ever.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/kubeconfig-kbreak-${var.challenge_slug}-xebia4ever.yaml"
  }
}
