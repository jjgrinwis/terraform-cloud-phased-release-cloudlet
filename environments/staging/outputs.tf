# output the created policy id
output "active_version" {
  value = var.policy_version == null ? nonsensative(data.tfe_outputs.policy.values["latest_version"]) : var.policy_version
}
