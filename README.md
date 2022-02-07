# Akamai Terraform Cloud Phased Release Cloudlet example #

Some example Terraform code on how to use the Akamai Phased Release Cloudlet with Terraform Cloud with a single policy shared between staging and production.
This version has 3 workspaces. One to just create the Phased Release Cloudlet policy, it won't activate it on staging. We created a separate workspace that's being triggerd by the policy workspace to start "planning". We can't auto-deploy when triggered from a remote CVS so you need to apply it. There is another workspace to push it to Akamai production environment. You can specify a specific version for Akamai production or just use the latest one.

Some variables are shared between the different workspaces and each workspace has it's own .tfvars file for workspace specific settings like version number to activate for example.

<img width="329" alt="image" src="https://user-images.githubusercontent.com/3455889/152854740-ec7b4ece-0231-4b8a-8ba6-0b20df27081c.png">
