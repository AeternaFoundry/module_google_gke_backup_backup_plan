resource "google_gke_backup_backup_plan" "gke_backup_backup_plans" {
  for_each = var.gke_backup_backup_plans

  cluster         = each.value.cluster
  location        = each.value.location
  name            = each.value.name
  deactivated     = each.value.deactivated
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project

  dynamic "backup_config" {
    for_each = each.value.backup_config != null ? [each.value.backup_config] : []
    content {
      all_namespaces = backup_config.value.all_namespaces
      dynamic "encryption_key" {
        for_each = backup_config.value.encryption_key != null ? [backup_config.value.encryption_key] : []
        content {
          gcp_kms_encryption_key = encryption_key.value.gcp_kms_encryption_key
        }
      }
      include_secrets     = backup_config.value.include_secrets
      include_volume_data = backup_config.value.include_volume_data
      permissive_mode     = backup_config.value.permissive_mode
      dynamic "selected_applications" {
        for_each = backup_config.value.selected_applications != null ? [backup_config.value.selected_applications] : []
        content {
          dynamic "namespaced_names" {
            for_each = selected_applications.value.namespaced_names
            content {
              name      = namespaced_names.value.name
              namespace = namespaced_names.value.namespace
            }
          }
        }
      }
      dynamic "selected_namespace_labels" {
        for_each = backup_config.value.selected_namespace_labels != null ? [backup_config.value.selected_namespace_labels] : []
        content {
          dynamic "resource_labels" {
            for_each = selected_namespace_labels.value.resource_labels
            content {
              key   = resource_labels.value.key
              value = resource_labels.value.value
            }
          }
        }
      }
      dynamic "selected_namespaces" {
        for_each = backup_config.value.selected_namespaces != null ? [backup_config.value.selected_namespaces] : []
        content {
          namespaces = selected_namespaces.value.namespaces
        }
      }
    }
  }

  dynamic "backup_schedule" {
    for_each = each.value.backup_schedule != null ? [each.value.backup_schedule] : []
    content {
      cron_schedule = backup_schedule.value.cron_schedule
      paused        = backup_schedule.value.paused
      dynamic "rpo_config" {
        for_each = backup_schedule.value.rpo_config != null ? [backup_schedule.value.rpo_config] : []
        content {
          dynamic "exclusion_windows" {
            for_each = rpo_config.value.exclusion_windows != null ? rpo_config.value.exclusion_windows : []
            content {
              daily = exclusion_windows.value.daily
              dynamic "days_of_week" {
                for_each = exclusion_windows.value.days_of_week != null ? [exclusion_windows.value.days_of_week] : []
                content {
                  days_of_week = days_of_week.value.days_of_week
                }
              }
              duration = exclusion_windows.value.duration
              dynamic "single_occurrence_date" {
                for_each = exclusion_windows.value.single_occurrence_date != null ? [exclusion_windows.value.single_occurrence_date] : []
                content {
                  day   = single_occurrence_date.value.day
                  month = single_occurrence_date.value.month
                  year  = single_occurrence_date.value.year
                }
              }
              start_time {
                hours   = exclusion_windows.value.start_time.hours
                minutes = exclusion_windows.value.start_time.minutes
                nanos   = exclusion_windows.value.start_time.nanos
                seconds = exclusion_windows.value.start_time.seconds
              }
            }
          }
          target_rpo_minutes = rpo_config.value.target_rpo_minutes
        }
      }
    }
  }

  dynamic "retention_policy" {
    for_each = each.value.retention_policy != null ? [each.value.retention_policy] : []
    content {
      backup_delete_lock_days = retention_policy.value.backup_delete_lock_days
      backup_retain_days      = retention_policy.value.backup_retain_days
      locked                  = retention_policy.value.locked
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

