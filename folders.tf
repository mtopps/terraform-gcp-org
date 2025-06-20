locals {

  org_folders = {
    "networks" = {
      display_name = "Networks"
    }
    "compute" = {
      display_name = "Compute"
    }
    "colab" = {
      display_name = "Colab Enterprise"
    }
    "observability" = {
      display_name = "Observability"
    }
  }
}

resource "google_folder" "folders" {
  for_each = local.org_folders

  deletion_protection = true
  display_name        = each.value.display_name
  parent              = data.google_organization.org.id
}
