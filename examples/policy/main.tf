provider "aws" {
  region = "eu-west-1"
}

# Attach existing policy to the role
module "example_role_1" {
  source = "../.."

  name_prefix = "Example"
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

# Create new policy attached to the role
data "aws_iam_policy_document" "flow_logs" {
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

module "example_role_2" {
  source = "../.."

  name_prefix = "Example"
  role_policy = data.aws_iam_policy_document.flow_logs.json
}
