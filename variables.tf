variable "name" {
  type        = string
  description = "The name of the role"
}

variable "assume_policy" {
  type        = string
  default     = null
  description = "The assume policy to attach to the role"
}

variable "create_policy" {
  type        = bool
  default     = null
  description = "Overrule whether the IAM role policy has to be created"
}

variable "max_session_duration" {
  type        = number
  default     = 3600
  description = "The maximum session duration (in seconds) for the role"
}

variable "permissions_boundary" {
  type        = string
  default     = null
  description = "The permissions boundary to set on the role"
}

variable "principal_identifiers" {
  type = list(object({
    identifiers = list(string)
    type        = string
  }))
  default     = []
  description = "List object of identifiers with type for principals"
}

variable "policy_arns" {
  type        = set(string)
  default     = []
  description = "A set of policy ARNs to attach to the user"
}

variable "postfix" {
  type        = bool
  default     = true
  description = "Postfix the role and policy names with Role and Policy"
}

variable "role_policy" {
  type        = string
  default     = null
  description = "The IAM policy to attach to the role"
}


variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the role"
}
