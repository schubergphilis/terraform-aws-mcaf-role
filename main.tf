locals {
  assume_policy = var.assume_policy != null ? var.assume_policy : data.aws_iam_policy_document.default.json
  create_policy = var.force_create_policy ? true : var.role_policy != null
}

provider "aws" {}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = var.principal_type
      identifiers = var.principal_identifiers
    }
  }
}

resource "aws_iam_role" "default" {
  name                 = "${var.name}${var.postfix ? "Role" : ""}"
  assume_role_policy   = local.assume_policy
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy" "default" {
  count  = local.create_policy ? 1 : 0
  name   = "${var.name}${var.postfix ? "Policy" : ""}"
  role   = aws_iam_role.default.id
  policy = var.role_policy
}

resource "aws_iam_role_policy_attachment" "default" {
  for_each = var.policy_arns

  role       = aws_iam_role.default.name
  policy_arn = each.value
}
