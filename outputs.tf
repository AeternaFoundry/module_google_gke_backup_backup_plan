output "gke_backup_backup_plans_id" {
  description = "Map of id values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no id are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.id if v.id != null && length(v.id) > 0 }
}
output "gke_backup_backup_plans_backup_config" {
  description = "Map of backup_config values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no backup_config are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => one(v.backup_config) if v.backup_config != null && length(v.backup_config) > 0 }
}
output "gke_backup_backup_plans_backup_schedule" {
  description = "Map of backup_schedule values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no backup_schedule are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => one(v.backup_schedule) if v.backup_schedule != null && length(v.backup_schedule) > 0 }
}
output "gke_backup_backup_plans_cluster" {
  description = "Map of cluster values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no cluster are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.cluster if v.cluster != null && length(v.cluster) > 0 }
}
output "gke_backup_backup_plans_deactivated" {
  description = "Map of deactivated values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no deactivated are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.deactivated if v.deactivated != null }
}
output "gke_backup_backup_plans_deletion_policy" {
  description = "Map of deletion_policy values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no deletion_policy are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "gke_backup_backup_plans_description" {
  description = "Map of description values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no description are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.description if v.description != null && length(v.description) > 0 }
}
output "gke_backup_backup_plans_effective_labels" {
  description = "Map of effective_labels values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no effective_labels are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "gke_backup_backup_plans_etag" {
  description = "Map of etag values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no etag are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "gke_backup_backup_plans_labels" {
  description = "Map of labels values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no labels are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "gke_backup_backup_plans_location" {
  description = "Map of location values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no location are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.location if v.location != null && length(v.location) > 0 }
}
output "gke_backup_backup_plans_name" {
  description = "Map of name values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no name are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.name if v.name != null && length(v.name) > 0 }
}
output "gke_backup_backup_plans_project" {
  description = "Map of project values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no project are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.project if v.project != null && length(v.project) > 0 }
}
output "gke_backup_backup_plans_protected_namespace_count" {
  description = "Map of protected_namespace_count values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no protected_namespace_count are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.protected_namespace_count if v.protected_namespace_count != null }
}
output "gke_backup_backup_plans_protected_pod_count" {
  description = "Map of protected_pod_count values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no protected_pod_count are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.protected_pod_count if v.protected_pod_count != null }
}
output "gke_backup_backup_plans_retention_policy" {
  description = "Map of retention_policy values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no retention_policy are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => one(v.retention_policy) if v.retention_policy != null && length(v.retention_policy) > 0 }
}
output "gke_backup_backup_plans_state" {
  description = "Map of state values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no state are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.state if v.state != null && length(v.state) > 0 }
}
output "gke_backup_backup_plans_state_reason" {
  description = "Map of state_reason values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no state_reason are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.state_reason if v.state_reason != null && length(v.state_reason) > 0 }
}
output "gke_backup_backup_plans_terraform_labels" {
  description = "Map of terraform_labels values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no terraform_labels are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "gke_backup_backup_plans_uid" {
  description = "Map of uid values across all gke_backup_backup_plans, keyed the same as var.gke_backup_backup_plans except keys with no uid are omitted"
  value       = { for k, v in google_gke_backup_backup_plan.gke_backup_backup_plans : k => v.uid if v.uid != null && length(v.uid) > 0 }
}

