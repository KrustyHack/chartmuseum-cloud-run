terraform {
  # Doc for version constraint : https://www.terraform.io/docs/language/expressions/version-constraints.html#version-constraint-syntax
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
