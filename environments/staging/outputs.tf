# output the created policy id
output "active_version" {
  value = nonsensitive(resource.akamai_cloudlets_policy_activation.pr_staging.version)
}
