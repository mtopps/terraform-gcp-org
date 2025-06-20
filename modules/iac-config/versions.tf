terraform {
  required_version = ">=1.11.0"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0, < 7.0.0"
    }
  }
}
