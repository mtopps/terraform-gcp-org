terraform {
  backend "gcs" {
    bucket = "tf-state-mtopps-cicd"
    prefix = "org/terraform/state"
  }
}