terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "1.10.0"
    }
  }
}

# we use information from our staging setup but we only need the policy id and optionally the latest version
# make sure to share the output vars from this workspace with other workspace(s)
data "tfe_outputs" "policy" {
  organization = "grinwis-com"
  workspace    = "phased-release-cloudlet-policy"
}

# now activate this policy on production using latest policy version by default.
resource "akamai_cloudlets_policy_activation" "pr_production" {
  policy_id = nonsensitive(data.tfe_outputs.staging.values["policy_id"])
  network   = "production"
  version   = var.policy_version == null ? nonsensitive(data.tfe_outputs.policy.values["latest_version"]) : var.policy_version
  # version               = resource.akamai_cloudlets_policy.phased_release.version
  associated_properties = var.hostnames
}
