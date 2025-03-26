data "aws_iam_policy_document" "default" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = var.principal_type
      identifiers = var.principal_identifiers
    }
  }
}

locals {
  assume_policy = var.assume_policy != null ? var.assume_policy : data.aws_iam_policy_document.default.json

  # If the user explicitly sets create_policy, honor it.
  # Otherwise, fall back to checking if role_policy is provided.
  create_policy = (
    var.create_policy != null
    ? var.create_policy
    : (var.role_policy != null)
  )

  policy_suffix = var.postfix ? "Policy" : ""

  policy_name = (
    local.create_policy
    ? "${var.name}${local.policy_suffix}"
    : "${var.name}-empty-policy"
  )
}

resource "aws_iam_role" "default" {
  assume_role_policy    = local.assume_policy
  description           = var.description
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  name                  = var.name != null ? "${var.name}${var.postfix ? "Role" : ""}" : null
  name_prefix           = var.name_prefix != null ? "${var.name_prefix}${var.postfix ? "Role" : ""}" : null
  path                  = var.path
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags
}

data "aws_iam_policy_document" "empty" {
  # No statements = empty policy document
}

resource "aws_iam_role_policy" "default" {
  # no count, no for_each
  name        = local.policy_name
  name_prefix = var.name_prefix != null ? "${var.name_prefix}${var.postfix ? "Policy" : ""}" : null
  role        = aws_iam_role.default.id

  # If local.create_policy is unknown at plan time or false, just attach an empty policy.
  policy = local.create_policy ? var.role_policy : data.aws_iam_policy_document.empty.json
}

resource "aws_iam_role_policy_attachment" "default" {
  for_each = var.policy_arns

  role       = aws_iam_role.default.name
  policy_arn = each.value
}
