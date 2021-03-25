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
  }
  required_version = ">= 0.14"
}

provider "scaleway" {
  zone            = "nl-ams-1"
  region          = "nl-ams"
  project_id      = "7ee16446-7711-4171-a7c2-4bb6f0d4c4c8"
}

provider "kubernetes" {
  alias = "kapsule_software"
  config_path = "~/.kube/kubeconfig-kbreak-software-xebia4ever.yaml"
}

provider "helm" {
  alias = "kapsule_software"
  kubernetes {
    config_path = "~/.kube/kubeconfig-kbreak-software-xebia4ever.yaml"
  }
}

terraform {
  backend "s3" {
    bucket                      = "breakathon-xebia4ever-tfstate"
    key                         = "main-breakathon.tfstate"
    region                      = "nl-ams"
    endpoint                    = "https://s3.nl-ams.scw.cloud"
    # These skips are necessary because otherwise the backend checks for
    # **AWS** credentials and regions, not Scaleway ;)
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}
