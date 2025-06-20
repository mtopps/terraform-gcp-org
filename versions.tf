terraform {
  required_version = ">=1.11.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.7.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.0.0, < 7.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "google" {
  billing_project       = "mtopps-iac"
  user_project_override = true
}

provider "google-beta" {
  billing_project       = "mtopps-iac"
  user_project_override = true
}
