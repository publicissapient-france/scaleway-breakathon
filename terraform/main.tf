terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone            = "fr-par-1"
  region          = "fr-par"
  project_id      = "80700332-ae36-4276-bbfe-a24b85d2aa19"
}

terraform {
  backend "s3" {
    bucket                      = "xebia4ever-breakathon-tfstate"
    key                         = "main-breakathon.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    # These skips are necessary because otherwise the backend checks for
    # **AWS** credentials and regions, not Scaleway ;)
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}
