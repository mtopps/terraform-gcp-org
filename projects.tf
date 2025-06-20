locals {
  # projects_with_resolved_refs = {
  #   for project_name, config in var.projects : project_name => merge(config, {
  #     folder_id = google_folder.folders[config.folder_name].id
  #     shared_vpc_subnets = [
  #       for subnet in config.shared_vpc_subnets :
  #       subnet == "projects/test-nwhp-bd66/regions/australia-southeast1/subnetworks/test-nwhp-s1" ?
  #       data.google_compute_subnetwork.test_nwhp_subnet.id : subnet
  #     ]
  #   })
  # }

  common_apis = [
    "serviceusage.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
  ]
}

module "project_factory" {
  for_each = var.projects
  source   = "terraform-google-modules/project-factory/google"
  version  = "17.0.0"

  name            = each.key
  org_id          = var.org_id
  billing_account = var.billing_account
  deletion_policy = "DELETE"

  random_project_id       = true
  project_id              = try(each.value.project_id, null) != null ? each.value.project_id : ""
  folder_id               = google_folder.folders[each.value.folder_name].id
  default_service_account = "disable"

  svpc_host_project_id = try(each.value.svpc_host_project_id, "")
  shared_vpc_subnets   = try(each.value.shared_vpc_subnets, [])

  budget_alert_spend_basis                = try(each.value.budget_alert_spend_basis, "CURRENT_SPEND")
  budget_amount                           = try(each.value.budget_amount, 5)
  budget_alert_spent_percents             = try(each.value.budget_alert_spent_percents, [0.9, 1.0, 1.1, 1.2])
  budget_display_name                     = try(each.value.budget_display_name, "Budget for ${each.key}")
  budget_monitoring_notification_channels = [google_monitoring_notification_channel.main["mtopps-iac"].id]

  activate_apis = toset(concat(
    local.common_apis,
    try(each.value.activate_apis, [])
  ))

  depends_on = [
    google_folder.folders
  ]
}


module "project_iac_config" {
  for_each = { for k, v in(var.projects) :
  k => v if try(v.iac_bucket_location, "") != "" && try(v.iac_bucket_location, null) != null }
  source                = "./modules/iac-config"
  project_id            = module.project_factory[each.key].project_id
  iac_bucket_location   = each.value.iac_bucket_location
  iac_bucket_log_bucket = "logbucket_org_all"
  labels                = try(each.value.project_labels, {})

  depends_on = [
    module.project_factory
  ]
}
