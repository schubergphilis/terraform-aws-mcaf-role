provider "aws" {
  region = "eu-west-1"
}

# Attach existing policy to the role
module "basic_role" {
  source = "../.."

  name_prefix = "Example"
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

# Create new policy attached to the role
data "aws_iam_policy_document" "policy" {
  statement {
    sid    = "PushToCloudWatch"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

module "basic_role_custom_policy" {
  source = "../.."

  name_prefix = "Example"
  role_policy = data.aws_iam_policy_document.policy.json
}
