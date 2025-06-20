resource "google_storage_bucket" "this" {
  #checkov:skip=CKV_GCP_62:Don't require logging (1)
  #checkov:skip=CKV_GCP_63:Don't require logging (2)
  name                        = "${var.project_id}-iac"
  location                    = var.iac_bucket_location
  project                     = var.project_id
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = false
  public_access_prevention    = "enforced"
  labels                      = var.labels

  versioning {
    enabled = true
  }

  logging {
    log_bucket = var.iac_bucket_log_bucket
  }
}
