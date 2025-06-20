variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  nullable    = false
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  nullable    = false
}

variable "projects" {
  description = "Configuration for GCP project factory. Each project configuration includes folder assignment, IAC settings, budget, APIs, and networking."
  type = map(object({
    folder_name                 = string
    iac_bucket_location         = optional(string, "")
    budget_amount               = optional(number, 5)
    budget_alert_spend_basis    = optional(string, "CURRENT_SPEND")
    budget_alert_spent_percents = optional(list(number), [0.9, 1.0, 1.1, 1.2])
    budget_display_name         = optional(string, null)
    project_id                  = optional(string, null)
    project_labels              = optional(map(string), {})
    activate_apis               = optional(list(string), [])
    svpc_host_project_id        = optional(string, "")
    shared_vpc_subnets          = optional(list(string), [])
  }))
  default = {}

  validation {
    condition = alltrue([
      for project_name, config in var.projects :
      config.budget_amount >= 0
    ])
    error_message = "Budget amount must be a non-negative number."
  }

  validation {
    condition = alltrue([
      for project_name, config in var.projects :
      length(project_name) > 0 && length(project_name) <= 30
    ])
    error_message = "Project names must be between 1 and 30 characters long."
  }
}

variable "notification_channels" {
  description = "Notification channels to be created"
  type = map(object({
    display_name  = string
    type          = string
    email_address = string
    project_id    = string
  }))
  default = {}
}