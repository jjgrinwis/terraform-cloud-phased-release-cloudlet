# some variables only used during policy creation

variable "to_deta_match_value" {
  description = "match value of all items that need to go to deta"
  type        = string
  default     = null
}

variable "description" {
  description = "Specific name for this policy version"
  type        = string
  default     = "Terraform updated rules"
}

variable "group_name" {
  description = "Akamai group to create this resource in"
  type        = string
}
