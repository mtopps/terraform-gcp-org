resource "google_service_account" "this" {
  account_id   = "iac-tf-sa"
  display_name = "Service Account for IAC project-level operations"
  project      = var.project_id
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.terraform_sa_iam_project_roles)
  project  = var.project_id
  role     = "roles/${each.value}"
  member   = "serviceAccount:${google_service_account.this.email}"
}

resource "google_storage_bucket_iam_member" "this" {
  bucket = google_storage_bucket.this.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.this.email}"
}
