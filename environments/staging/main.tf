# our phased release cloudlet test
terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "1.10.0"
    }
  }
}

# we used this part to reinitialize the remote .tfstate
# we used 'terraform import akamai_cloudlets_policy_activation.pr_staging pr_grinwis'
terraform {
  backend "remote" {
    organization = "grinwis-com"

    workspaces {
      name = "phased-release-cloudlet-staging"
    }
  }
}

# we use information from our staging setup but we only need the policy id and optionally the latest version
# make sure to share the output vars from this workspace with other workspace(s)
data "tfe_outputs" "policy" {
  organization = "grinwis-com"
  workspace    = "phased-release-cloudlet-policy"
}

# now activate this policy on staging using latest policy version by default.
resource "akamai_cloudlets_policy_activation" "pr_staging" {
  policy_id             = data.tfe_outputs.policy.values["id"]
  network               = "staging"
  version               = var.policy_version == null ? data.tfe_outputs.policy.values["latest_version"] : var.policy_version
  associated_properties = var.hostnames
}
