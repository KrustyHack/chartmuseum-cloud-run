terraform {
  cloud {
    organization = "blackcreeper-network"

    workspaces {
      name = "blackcreeper-network_chartmuseum-cloud-run"
    }
  }

  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.71"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~>3.71"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
