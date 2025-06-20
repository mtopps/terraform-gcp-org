<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.11.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 6.0.0, < 7.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.7.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_logging-destination"></a> [logging-destination](#module\_logging-destination) | terraform-google-modules/log-export/google//modules/logbucket | 11.0.0 |
| <a name="module_logsink-logbucketsink"></a> [logsink-logbucketsink](#module\_logsink-logbucketsink) | terraform-google-modules/log-export/google | 11.0.0 |
| <a name="module_project_factory"></a> [project\_factory](#module\_project\_factory) | terraform-google-modules/project-factory/google | 17.0.0 |
| <a name="module_project_iac_config"></a> [project\_iac\_config](#module\_project\_iac\_config) | ./modules/iac-config | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder.folders](https://registry.terraform.io/providers/hashicorp/google/6.7.0/docs/resources/folder) | resource |
| [google_monitoring_notification_channel.main](https://registry.terraform.io/providers/hashicorp/google/6.7.0/docs/resources/monitoring_notification_channel) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/id) | resource |
| [google_organization.org](https://registry.terraform.io/providers/hashicorp/google/6.7.0/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate projects with | `string` | n/a | yes |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification channels to be created | <pre>map(object({<br>    display_name  = string<br>    type          = string<br>    email_address = string<br>    project_id    = string<br>  }))</pre> | `{}` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated resources | `string` | n/a | yes |
| <a name="input_projects"></a> [projects](#input\_projects) | Configuration for GCP project factory. Each project configuration includes folder assignment, IAC settings, budget, APIs, and networking. | <pre>map(object({<br>    folder_name                 = string<br>    iac_bucket_location         = optional(string, "")<br>    budget_amount               = optional(number, 5)<br>    budget_alert_spend_basis    = optional(string, "CURRENT_SPEND")<br>    budget_alert_spent_percents = optional(list(number), [0.9, 1.0, 1.1, 1.2])<br>    budget_display_name         = optional(string, null)<br>    project_id                  = optional(string, null)<br>    project_labels              = optional(map(string), {})<br>    activate_apis               = optional(list(string), [])<br>    svpc_host_project_id        = optional(string, "")<br>    shared_vpc_subnets          = optional(list(string), [])<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->