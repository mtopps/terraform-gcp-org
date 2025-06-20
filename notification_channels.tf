resource "google_monitoring_notification_channel" "main" {
  for_each     = var.notification_channels
  display_name = each.value.display_name
  type         = each.value.type
  labels = {
    email_address = each.value.email_address
  }
  project      = each.value.project_id
  force_delete = false
}
