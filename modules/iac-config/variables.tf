variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "terraform_sa_iam_project_roles" {
  description = "GCP IAM roles to assign to the Service Account used by AzDO/GitHub/Gitlab via Terraform."
  type        = list(string)
  default     = ["owner"]
}

variable "iac_bucket_location" {
  description = "GCP location for IaC bucket"
  type        = string
}

variable "iac_bucket_log_bucket" {
  description = "GCP log bucket for IaC bucket"
  type        = string
}

variable "labels" {
  description = "GCP labels"
  type        = map(string)
}
