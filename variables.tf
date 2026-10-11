variable "gke_backup_backup_plans" {
  description = <<EOT
Map of gke_backup_backup_plans, attributes below
Required:
    - cluster
    - location
    - name
Optional:
    - deactivated
    - deletion_policy
    - description
    - labels
    - project
    - backup_config (block):
        - all_namespaces (optional)
        - encryption_key (optional, block):
            - gcp_kms_encryption_key (required)
        - include_secrets (optional)
        - include_volume_data (optional)
        - permissive_mode (optional)
        - selected_applications (optional, block):
            - namespaced_names (required, block):
                - name (required)
                - namespace (required)
        - selected_namespace_labels (optional, block):
            - resource_labels (required, block):
                - key (required)
                - value (required)
        - selected_namespaces (optional, block):
            - namespaces (required)
    - backup_schedule (block):
        - cron_schedule (optional)
        - paused (optional)
        - rpo_config (optional, block):
            - exclusion_windows (optional, block):
                - daily (optional)
                - days_of_week (optional, block):
                    - days_of_week (optional)
                - duration (required)
                - single_occurrence_date (optional, block):
                    - day (optional)
                    - month (optional)
                    - year (optional)
                - start_time (required, block):
                    - hours (optional)
                    - minutes (optional)
                    - nanos (optional)
                    - seconds (optional)
            - target_rpo_minutes (required)
    - retention_policy (block):
        - backup_delete_lock_days (optional)
        - backup_retain_days (optional)
        - locked (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cluster         = string
    location        = string
    name            = string
    deactivated     = optional(bool)
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    backup_config = optional(object({
      all_namespaces = optional(bool)
      encryption_key = optional(object({
        gcp_kms_encryption_key = string
      }))
      include_secrets     = optional(bool)
      include_volume_data = optional(bool)
      permissive_mode     = optional(bool)
      selected_applications = optional(object({
        namespaced_names = list(object({
          name      = string
          namespace = string
        }))
      }))
      selected_namespace_labels = optional(object({
        resource_labels = list(object({
          key   = string
          value = string
        }))
      }))
      selected_namespaces = optional(object({
        namespaces = list(string)
      }))
    }))
    backup_schedule = optional(object({
      cron_schedule = optional(string)
      paused        = optional(bool)
      rpo_config = optional(object({
        exclusion_windows = optional(list(object({
          daily = optional(bool)
          days_of_week = optional(object({
            days_of_week = optional(list(string))
          }))
          duration = string
          single_occurrence_date = optional(object({
            day   = optional(number)
            month = optional(number)
            year  = optional(number)
          }))
          start_time = object({
            hours   = optional(number)
            minutes = optional(number)
            nanos   = optional(number)
            seconds = optional(number)
          })
        })))
        target_rpo_minutes = number
      }))
    }))
    retention_policy = optional(object({
      backup_delete_lock_days = optional(number)
      backup_retain_days      = optional(number)
      locked                  = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.gke_backup_backup_plans : (
        v.backup_config == null || (v.backup_config.selected_applications == null || (length(v.backup_config.selected_applications.namespaced_names) >= 1))
      )
    ])
    error_message = "Each namespaced_names list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gke_backup_backup_plans : (
        v.backup_config == null || (v.backup_config.selected_namespace_labels == null || (length(v.backup_config.selected_namespace_labels.resource_labels) >= 1))
      )
    ])
    error_message = "Each resource_labels list must contain at least 1 items"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

