billing_account = "00000000-00001-01234"
org_id          = "000000000000"

projects = {
  "project-1" = {
    folder_name         = "networks"
    iac_bucket_location = "australia-southeast1"
    budget_amount       = 5
    activate_apis = [
      "compute.googleapis.com",
      "servicenetworking.googleapis.com",
      "dns.googleapis.com",
    ]
  }
  "project-2" = {
    folder_name         = "observability"
    iac_bucket_location = "australia-southeast1"
    budget_amount       = 5
    activate_apis = [
      "monitoring.googleapis.com",
      "logging.googleapis.com",
    ]
  }
  "project-3" = {
    folder_name         = "compute"
    iac_bucket_location = "australia-southeast1"
    budget_amount       = 5
    activate_apis = [
      "compute.googleapis.com",
      "oslogin.googleapis.com",
      "osconfig.googleapis.com",
      "oslogin.googleapis.com",
      "monitoring.googleapis.com",
      "logging.googleapis.com",
    ]
    svpc_host_project_id = "project-1"
    shared_vpc_subnets = [
      "projects/project-1/regions/australia-southeast1/subnetworks/subnet-1"
    ]
  }
}

notification_channels = {
  "channel-1" = {
    display_name  = "Example Channel"
    type          = "email"
    email_address = "user@example.com"
    project_id    = "project-123"
  }
}