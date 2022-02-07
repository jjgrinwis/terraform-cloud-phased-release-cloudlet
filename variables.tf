variable "hostnames" {
  description = "One or more hostnames that's using this cloudlet"
  type        = list(string)
  validation {
    condition     = length(var.hostnames) > 0
    error_message = "At least one hostname should be provided, it can't be empty."
  }
}

variable "policy_name" {
  description = "The Phased Release cloudlet policy name"
  type        = string
}


variable "policy_version" {
  description = "By default latest version will be used, can be overwritten using this variable"
  type        = number
  default     = null
}
