variable "name" {
  type        = string
  default     = null
  description = "The name of the role.  Conflicts with `name_prefix`."

  validation {
    condition     = var.name != null ? length(var.name) <= 63 : true
    error_message = "The name must be less than or equal to 63 characters in length"
  }
}

variable "name_prefix" {
  type        = string
  default     = null
  description = "Creates a unique role and policy name beginning with the specified prefix. Conflicts with `name`."

  validation {
    condition     = var.name_prefix != null ? length(var.name_prefix) <= 37 : true
    error_message = "The name prefix must be less than or equal to 37 characters in length"
  }
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

variable "description" {
  type        = string
  default     = null
  description = "The description of the role"
}

variable "force_detach_policies" {
  type        = bool
  default     = false
  description = "Force detaching any policies the role has before destroying it"
}

variable "max_session_duration" {
  type        = number
  default     = 3600
  description = "The maximum session duration (in seconds) for the role"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path to the role"
}

variable "permissions_boundary" {
  type        = string
  default     = null
  description = "The permissions boundary to set on the role"
}

variable "principal_type" {
  type        = string
  default     = ""
  description = "The type of assume role principal"
}

variable "principal_identifiers" {
  type        = list(string)
  default     = []
  description = "List of identifiers for principals"
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
  default     = null
  description = "A mapping of tags to assign to the role"
}
